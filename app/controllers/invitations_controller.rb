class InvitationsController < ApplicationController
  def new
  end

  def create
    invite = Invitation.new(invitation_parmas)
    invite.token = generate_token
    project = invite.project = Project.find(params[:id])
    if create.save
      redirect_to project
    else
      render :new
    end
  end

  def show
  end

  protected
  def invitation_parmas
    params.require(:invitation).permit(:email)
  end

  def generate_token

  end
end
