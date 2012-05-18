module UsersHelper

  def current_user
    if session[:user].present? then User.find(session[:user][:id]) end
  end

end
