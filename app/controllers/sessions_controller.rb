class SessionsController < ApplicationController
  skip_before_action  :require_login, only: [:new,  :create]

  def new
    if current_user
        redirect_to root_url, notice: "You're already logged in!"
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to groups_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
