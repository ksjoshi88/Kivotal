require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get redirected to login page if not logged in" do
    get home_index_url
    assert_redirected_to new_user_session_path
  end

  test 'should be able to access the home page upon successful login' do
    user = create(:manager)
    sign_in user
    get home_index_url
    assert_response :success
  end

  test "should be able to view manager homepage when logged in as manager" do
    user = create(:manager)
    sign_in user
    get home_index_url
    assert_response :success
    assert_select '.manager-homepage-container',1
  end

  test "should be able to view developer homepage when logged in as developer" do
    user = create(:developer)
    sign_in user
    get home_index_url
    assert_redirected_to work_projects_path
  end

  test "manage should be able to see data about all his/her projects" do
    manager = create(:manager)
    3.times do
      create(:project, manager: manager)
    end
    sign_in manager
    get home_index_url
    assert_equal assigns(:projects).count, 3
  end

  test "developer should not be able to call get project status" do
    project = create(:project)
    developer = create(:developer)
    sign_in developer
    get get_project_status_url(project.id)
    assert_redirected_to root_path
  end

  test "manager should be able to get project status" do
    manager = create(:manager)
    3.times do
      project = create(:project, manager: manager)
      2.times do
        create(:task, :assigned, project: project)
        create(:task, :in_progress, project: project)
        create(:task, :done, project: project)
      end
    end
    sign_in manager
    get get_project_status_url(Project.first.id)
    assert_equal assigns(:project).tasks.count, 6
  end

end
