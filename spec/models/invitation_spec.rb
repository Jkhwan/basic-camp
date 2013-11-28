require 'spec_helper'

describe Invitation do
  context "Validation" do
    it "should fail if email is empty" do
      invite = FactoryGirl.build :invitation, email: nil
      expect(invite.save).to be(false)
      expect(invite.errors[:email].first).to eq("can't be blank")
    end
    it "should fail if it is not associated to a project" do
      invite = FactoryGirl.build :invitation, project: nil
      expect(invite.save).to be(false)
      expect(invite.errors[:project].first).to eq("can't be blank")
    end
    it "should fail if token is empty" do
      invite = FactoryGirl.build :invitation, token: nil
      expect(invite.save).to be(false)
      expect(invite.errors[:token].first).to eq("can't be blank")
    end
    it "should fail if there is another invitation with the email and project" do
      invite = FactoryGirl.create :invitation
      invite1 = FactoryGirl.build :invitation, email: invite.email, project: invite.project
      expect(invite1.save).to be(false)
      expect(invite1.errors[:email].first).to eq("has already been taken")
    end
    it "should succeed if there is another invitation with the same email but different project" do
      invite = FactoryGirl.create :invitation
      invite1 = FactoryGirl.build :invitation, email: invite.email
      expect(invite1.save).to be(true)
    end
  end
end
