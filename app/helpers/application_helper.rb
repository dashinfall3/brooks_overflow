module ApplicationHelper

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
  	current_user ? true : redirect_to(root_path)
  end
end
