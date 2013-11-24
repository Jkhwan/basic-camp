class ProfilesController < ApplicationController

  before_action :require_user, :restrict_access

  def edit
  end

  def update
    if @user.update_attributes(profile_params)
      redirect_to projects_path, notice: "User profile updated successfully."
    else
      render :edit
    end
  end

  protected

  def require_user
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar)
  end
end
