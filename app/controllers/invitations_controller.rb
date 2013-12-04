class InvitationsController < ApplicationController
  def new
  end

  def create
    invite = Invitation.new(invitation_parmas)
    project = invite.project = Project.find(params[:id])
    if create.save
      redirect_to project
    else
      render :new
    end
  end

  def show
    redirect_to new_invitation_participant_path(params[:id])
  end

  protected
  def invitation_parmas
    params.require(:invitation).permit(:email)
  end
end
