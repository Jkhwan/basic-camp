require "spec_helper"

describe UserMailer do
  let(:invite) { FactoryGirl.build :invitation }
  let(:last_email) { ActionMailer::Base.deliveries.last }

  context "Invitation email" do
    it "is containing valid subject, to, and from fields" do
      invite.save
      expect(last_email.subject).to match(/You're invited to join/)
      expect(last_email.to.first).to eq(invite.email)
      expect(last_email.from.first).to eq("jwan823@gmail.com")
    end
  end
end
