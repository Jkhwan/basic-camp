class DiscussionsController < ApplicationController

  before_action :restrict_access, :require_user, :require_project
  before_action :require_discussion, only: [:edit, :update, :show]

  def show
    @messages = @discussion.messages.order_by_date
    @message = @discussion.messages.new
  end

  def update
    if @discussion.update_attributes(discussion_params)
      redirect_to project_discussions_path, notice: "Discussion was created successfully."
    else
      render :edit
    end
  end

  def index
    @discussions = @project.discussions.order_by_date
  end

  def edit
  end

  def new
    @discussion = @project.discussions.new
  end

  def create
    @discussion = @project.discussions.new(discussion_params)
    @discussion.user_id = current_user.id
    if @discussion.save
      redirect_to project_discussions_path, notice: "Discussion was created successfully."
    else
      render :new
    end
  end

  protected

  def require_discussion
    @discussion = @project.discussions.find(params[:id])
  end

  def require_project
    @project = @user.projects.find(params[:project_id])
  end

  def require_user
    @user = current_user
  end

  def discussion_params
    params.require(:discussion).permit(:subject, :content)
  end

end
