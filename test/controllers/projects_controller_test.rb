require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = create(:manager)
    @project = create(:project, manager: @manager)
  end

  test "should not get index if not logged in" do
    get projects_url
    assert_redirected_to root_path
  end

  test "should not get index if logged in as a developer" do
    developer = create(:developer)
    sign_in developer
    get projects_url
    assert_redirected_to root_path
  end

  test "should not get index if logged in as manager" do
    sign_in @manager
    get projects_url
    assert_response :success
  end

  test "should get all projects created by logged in manager" do
    create(:project, manager: @manager)
    sign_in @manager
    get projects_url
    assert_response :success
    assert_equal assigns(:projects).count, 2
  end

  test "should get new if logged in as manager" do
    sign_in @manager
    get new_project_url
    assert_response :success
  end

  test "should be able to create a new project" do
    sign_in @manager
    assert_difference('Project.count') do
      post projects_url, params: { project: { title: 'ABC' } }
    end
    assert_redirected_to project_url(Project.last)
  end

  test "should be able to edit a project" do
    sign_in @manager
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    sign_in @manager
    patch project_url(@project), params: { project: { title: 'EDF' } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    sign_in @manager
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end
    assert_redirected_to projects_url
  end
end
