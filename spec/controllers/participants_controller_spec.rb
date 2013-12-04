require 'spec_helper'

describe ParticipantsController do

  let(:invite) { FactoryGirl.create :invitation }

  context 'GET new' do
    it "returns http success" do
      get :new, invitation_id: invite.token
      expect(response).to be_success
    end

    it "loads the token with the invitation id" do
      get :new, invitation_id: invite.token
      expect(assigns(:token)).to eq(invite.token)
    end

    it "loads the invitation using the token" do
      get :new, invitation_id: invite.token
      expect(assigns(:invite)).to eq(invite)
    end
  end

  context 'POST create' do
    it "redirects to login page if user is not logged in" do
      post :create, invitation_id: invite.token
      expect(response).to redirect_to(sessions_path)
    end

    it "redirects to project page if user is logged in" do
      @user = FactoryGirl.create :user
      session[:user_id] = @user.id
      post :create, invitation_id: invite.token

      expect(response).to redirect_to(project_path(id: invite.project_id))
    end
  end
end
