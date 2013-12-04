class ParticipantsController < ApplicationController

  before_action :require_invite, only: [:new, :create]

  def new
  end

  def create
    if current_user
      redirect_to project_path(id: @invite.project_id)
    else
      redirect_to sessions_path
    end
  end

  protected

  def require_invite
    @token = params[:invitation_id]
    @invite = Invitation.find_by(token: @token)
  end

  def participant_params
    params.require(:participant).permit(:accept)
  end
end
