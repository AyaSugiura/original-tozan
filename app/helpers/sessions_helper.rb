module SessionsHelper
  def current_manager
    @current_manager ||= Manager.find_by(id: session[:manager_id])
  end
  
  def manager_logged_in?
    !!current_manager
  end
end
