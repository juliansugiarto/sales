class SessionController < ApplicationController
	include SessionHelper
  def new
  	redirect_to root_path if is_logged_in?
  end

  def create
    if is_logged_in?
      redirect_to root_path
    end

    user = User.authentication(username: params[:username], password: params[:password])
    session[:user_id] = user.id

    redirect_to root_path

  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_path
  end
end
