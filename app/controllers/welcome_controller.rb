class WelcomeController < ApplicationController
  def index
    if current_user
      @projects = current_user.projects
      render 'projects/index'
    else
      @user = User.new
    end
  end
end
