class Admin::UsersController < ApplicationController
  before_action :restrict_access, :restrict_admin_access
  def index
    @users = User.all
  end
end
