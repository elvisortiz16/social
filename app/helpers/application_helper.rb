module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def logged_in?
    @current_user ||= User.find_by(session[:user_id]) if logged_in?
  end
end
