class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_manager_logged_in
    unless manager_logged_in?
      redirect_to root_path
    end
  end
end
