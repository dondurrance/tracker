module UsersHelper
  
  def current_user
    if session.nil? then 
      #session = false 
    end
    if session[:user].present? then User.find(session[:user][:id]) end
  end

end
