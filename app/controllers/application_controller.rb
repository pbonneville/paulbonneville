class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    users_path
  end

  def flash_to_headers
	  return unless request.xhr?
	  response.headers['X-Message'] = flash[:error]  unless flash[:error].blank?
	  response.headers['X-Message'] = flash[:notice]  unless flash[:notice].blank?
	  response.headers['X-Message'] = flash[:alert]  unless flash[:alert].blank?

	  flash.discard  # don't want the flash to appear when you reload page
  end
end
