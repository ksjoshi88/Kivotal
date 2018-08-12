class WorkProjectsController < ApplicationController

  before_action :authenticate_developer!


    def index
      @projects = current_user.work_projects.uniq
    end


end
