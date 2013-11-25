class AssetsController < ApplicationController

  before_action :require_project, :restrict_access

  def show
    @asset = @project.assets.find(params[:id])
    filename = @asset.file.url.split('/').last
    send_data @asset.file.url, filename: filename
  end

  def index
    @assets = @project.assets
    @asset = @project.assets.new
  end

  def new
    @asset = @project.assets.new
  end

  def create
    @asset = @project.assets.new(asset_params)
    @asset.user_id = current_user.id
    if @asset.save
      redirect_to project_assets_path, notice: "File was uploaded successfully."
    else
      redirect_to project_assets_path, alert: "Upload failed - invalid file format."
    end
  end

  def destroy
    @asset = @project.assets.find(params[:id])
    @asset.destroy
    redirect_to project_assets_path, notice: "File was deleted successfully."
  end

  protected

  def asset_params
    params.require(:asset).permit(:file)
  end

  def require_project
    @project = current_user.projects.find(params[:project_id])
  end
end
