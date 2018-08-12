class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :authenticate_manager!, only: [:get_project_status]

  def index
    if current_user.is_manager?
      @projects = current_user.projects.includes(:tasks => [:developer])
      @tasks = @projects.collect(&:tasks).flatten.uniq
      @devs =  @tasks.collect(&:developer).flatten.uniq
      @project_count = @projects.count
      @dev_count = @devs.count
      #need to do group_by,map and reduce here
    else
      redirect_to work_projects_path
    end
  end

  def get_project_status
    @project = Project.find(params[:id])
    render json: @project.tasks.group(:status).count(:status).to_a
  end

end
