class ProjectsController < ApplicationController

  before_action :restrict_access, :require_user
  before_action :require_project, only: [:show, :edit, :update]
  
  def show
  end

  def index
    @projects = @user.projects
  end

  def edit
  end

  def new
    @project = Project.new
  end

  def delete
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id

    if @project.save
      redirect_to projects_path, notice: "Project was created successfully."
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to project_path(@project), notice: "Project was updated successfully."
    else
      render :edit
    end
  end

  protected

  def require_user 
    @user = current_user
  end

  def require_project
    @project = @user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
