class Admin::ProjectsController < ApplicationController

  layout "admin"

  before_action :restrict_access, :restrict_admin_access
  def index
    @projects = Project.all
  end
end
