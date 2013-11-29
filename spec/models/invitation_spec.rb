require 'spec_helper'

describe Invitation do

  let(:invite) { FactoryGirl.build :invitation }
  after :each do
    ActionMailer::Base.deliveries.clear
  end

  context "Validation" do
    it "should fail if email is empty" do
      invite.email = nil
      expect(invite).to_not be_valid
      expect(invite.errors[:email].first).to eq("can't be blank")
    end
    it "should fail if it is not associated to a project" do
      invite.project = nil
      expect(invite).to_not be_valid
      expect(invite.errors[:project].first).to eq("can't be blank")
    end
    it "should fail if token is empty" do
      invite.token = nil
      expect(invite).to_not be_valid
      expect(invite.errors[:token].first).to eq("can't be blank")
    end
    it "should fail if there is another invitation with the same email and project" do
      FactoryGirl.create :invitation, email: invite.email, project: invite.project
      expect(invite).to be_invalid
      expect(invite.errors[:email].first).to eq("has already been taken")
    end
    it "should succeed if there is another invitation with the same email but different project" do
      FactoryGirl.create :invitation, email: invite.email
      expect(invite).to be_valid
      expect(invite.save).to be(true)
    end
  end

  context "Creation" do
    it "should succeeds in creating new invitation" do
      expect(invite).to be_a(Invitation)
    end
  end

  context "Email Confirmation" do

    it "should be sent when invitation is created successfully" do
      expect(invite.save).to be(true)
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it "should not be sent when invitation fails to create" do
      invite.email = nil
      expect(invite.save).to be(false)
      expect(ActionMailer::Base.deliveries.count).to eq(0)
    end
  end
end
