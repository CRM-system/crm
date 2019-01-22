class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(director)
    director
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  def logged_in_worker
  	unless current_worker
  		flash[:danger] = 'Please log in'
  		redirect_to root_url
  	end
  end


  # def admin_worker
  #   redirect_to(root_url) unless current_worker.admin?
  # end

end
