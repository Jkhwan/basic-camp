class Admin::UsersController < ApplicationController

  layout "admin"
  before_action :restrict_access, :restrict_admin_access
  def index
    @users = User.all
  end
end
