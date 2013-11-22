class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, notice: "Welcome back, #{user.first_name}"
    else
      flash[:alert] = "Log in failed."
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_path
  end
end
