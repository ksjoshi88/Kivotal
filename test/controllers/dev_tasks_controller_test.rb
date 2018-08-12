require 'test_helper'

class DevTasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @developer = create(:developer)
    @project = create(:project)
    @task = create(:task, :assigned, project: @project, developer_id: @developer.id)
  end

  test "developer should not be able to browse if not logged in" do
    get work_project_dev_tasks_url(@project)
    assert_redirected_to root_path
  end

  test "developer should be able to browse if logged in" do
    sign_in @developer
    get work_project_dev_tasks_url(@project)
    assert_response :success
    assert_equal assigns(:tasks).count,1
  end


end