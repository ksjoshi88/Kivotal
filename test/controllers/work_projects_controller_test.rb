require 'test_helper'

class WorkProjectsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @project = create(:project)
    @manager = @project.manager
    @developer = create(:developer)
    @task = create(:task,:assigned, project:@project, developer: @developer)
  end

  test "should not get index if not logged in" do
    get work_projects_index_url
    assert_redirected_to root_path
  end

  test "should not get index if logged in as Manager" do
    sign_in @manager
    get work_projects_index_url
    assert_redirected_to root_path
    sign_out @manager
  end

  test "should get index if logged in as Developer" do
    sign_in @developer
    get work_projects_index_url
    assert_response :success
    assert_equal assigns(:projects).count, 1
    sign_out @developer
  end

end
