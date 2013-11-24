class MessagesController < ApplicationController

  before_action :restrict_access
  before_action :require_project_discussion

  def show
  end

  def create
    @messages = @discussion.messages.order_by_date
    @message = @discussion.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to project_discussion_path(@project, @discussion)
    else
      render "discussions/show"
    end
  end

  def edit
  end

  def destroy
    @message = @discussion.messages.find(params[:id])
    @message.destroy

    redirect_to project_discussion_path(@project.id, @discussion.id), notice: "Message was deleted successfully."
  end

  protected

  def require_project_discussion
    @discussion = Discussion.find(params[:discussion_id])
    @project = Project.find(@discussion.project_id)
  end

  def message_params
    params.require(:message).permit(:subject, :content, :user_id)
    
  end
end
