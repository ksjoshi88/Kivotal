class DevTasksController < ApplicationController
  before_action :authenticate_developer!

  before_action :set_tasks
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @project.tasks.where(developer_id: current_user.id)
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to([@task.project, @task], notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tasks
    @project = current_user.work_projects.find(params[:work_project_id])
  end

  def set_task
    @task = @project.tasks.where(developer_id: current_user.id).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:todo, :status, :developer_id)
  end
end
