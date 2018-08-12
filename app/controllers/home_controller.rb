class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.is_manager?
      @projects = current_user.projects.includes(:tasks => [:developer])
      @tasks = @projects.collect(&:tasks).flatten.uniq
      @devs =  @tasks.collect(&:developer).flatten.uniq
    end
  end

end
