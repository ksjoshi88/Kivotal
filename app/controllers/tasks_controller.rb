class TasksController < ApplicationController
  before_action :set_tasks
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_manager!, only: [:index, :show, :new, :edit, :create, :destroy]
  before_action :authenticate_user!, only: [:update]

  # GET projects/1/tasks
  def index
    @tasks = @project.tasks
  end

  # GET projects/1/tasks/1
  def show
  end

  # GET projects/1/tasks/new
  def new
    @task = @project.tasks.build
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to([@task.project, @task], notice: 'Task was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @task.update_attributes(task_params)
      if current_user.has_role? :manager
        redirect_to([@task.project, @task], notice: 'Task was successfully updated.')
      else
        redirect_to work_project_dev_tasks_url([@task.project, @task], notice: 'Task was successfully updated.')
       end
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  def destroy
    @task.destroy
    redirect_to project_tasks_url(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasks
        @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:todo, :status, :developer_id)
    end
end
