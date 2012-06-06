class ApplicationController < ActionController::Base
  include UsersHelper
  protect_from_forgery
	before_filter :require_https

  def login_required
    if session[:user]
      user = User.find(session[:user][:id])
    else 
      flash[:warning] = 'Please login to continue'
      session[:return_to] = request.request_uri
      redirect_to :controller => "user_auth", :action => "login"
      false
    end
  end

  def admin_required
    role_required("Admin")
    return false
  end

  def role_required(rolename)
    if session[:user]
      user = User.find(session[:user][:id])

      # This makes the current user available to the views

      role = Role.find(:first, :conditions => { :name => rolename })
    end
    if session[:user] && user.has_role?(role)
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :login
    return false
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to(return_to)
    else
      redirect_to :welcome
    end
  end

#  def current_user
#    User.find(session[:user][:id])
#  end

  def write_access?
    current_user.roles.each do |role|
      if role.can_write? then return true end
    end
  end
 
  def require_https 
  redirect_to :protocol => "https://" unless(request.ssl? or request.local? or Rails.env.development?)  
  end

  def require_http 
  redirect_to :protocol => "http://" if (request.ssl?)  
  end

end
