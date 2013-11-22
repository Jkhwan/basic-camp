class WelcomeController < ApplicationController
  def index
    if current_user
      render 'projects/index'
    else
      @user = User.new
    end
  end
end
