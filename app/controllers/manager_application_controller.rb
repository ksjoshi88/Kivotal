class ManagerApplicationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_manager!

  def authenticate_manager!
    unless(current_user and (current_user.has_role? :manager))
      flash[:error] = 'Information you requested, either does not exist or is not authorized for access.'
      redirect_to root_url
      return
    end
  end

end