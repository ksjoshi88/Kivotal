class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  def authenticate_manager!
    unless(current_user and (current_user.has_role? :manager))
      flash[:error] = 'Information you requested, either does not exist or is not authorized for access.'
      redirect_to root_url
      return
    end
  end

  def authenticate_developer!
    unless(current_user and (current_user.has_role? :developer))
      flash[:error] = 'Information you requested, either does not exist or is not authorized for access.'
      redirect_to root_url
      return
    end
  end

  private

  def configure_permitted_parameters
    added_attrs = [ :first_name, :last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
