require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = create(:project)
    @task = create(:task, project: @project)
    @manager = @project.manager
    sign_in @manager
  end

  test "manager should not be able to browse if not logged in" do
    sign_out @manager
    get project_tasks_url(@project)
    assert_redirected_to root_path
  end

  test "manager should be able to browse if logged in" do
    create(:task, project: @project)
    get project_tasks_url(@project)
    assert_response :success
    assert_equal assigns(:tasks).count, 2
  end

  test "should get new for creating a new task" do
    get new_project_task_url(@project)
    assert_response :success
  end

  test "should be able to create a new task" do
    assert_difference('Task.count') do
      post project_tasks_url(@project), params: { task: @task.attributes }
    end
    assert_redirected_to project_task_path(@project, Task.last)
  end

  test "should be able to edit a task" do
    get  edit_project_task_url(@project,@task)
    assert_response :success
  end

  test "a manager should be able to update a task" do
    patch project_task_url(@project,@task), params: {task: @task.attributes }
    assert_redirected_to project_task_path(@project, Task.last)
  end

  test "a developer should be able to change status of the task assigned to him/her" do
    sign_out @manager
    developer = create(:developer)
    task = create(:task, :assigned, project: @project, developer_id: developer.id)
    sign_in developer
    patch project_task_url(@project,task), params: {task: {status: 'in_progress'} }
    assert_equal assigns(:task).status, 'in_progress'
  end

  test "should be able to delete a task" do
    assert_difference('Task.count', -1) do
      delete project_task_url(@project,@task)
    end

    assert_redirected_to project_tasks_path(@project)
  end
end
