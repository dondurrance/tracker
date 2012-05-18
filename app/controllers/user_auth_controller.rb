class UserAuthController < ApplicationController
  layout "main"

  before_filter :require_https
  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])

        flash[:message]  = "Login successful"
        redirect_to_stored
      else
        flash[:warning] = "Login unsuccessful"
      end
    end

  end

  def welcome
    user = User.find(session[:user][:id])
        redirect_to :tickets
  end

  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :login

  end

  end
