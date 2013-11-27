require 'spec_helper'

describe Participant do
  context "Validation" do
    it "should fails to add new entry if project has two users with same id" do
      @user = FactoryGirl.create :user
      @project = FactoryGirl.create :project, owner: @user

      @participant = Participant.new(user: @user, project: @project)
      expect(@participant.save).to eq(false)
      expect(@participant.errors[:user].first).to eq("has already been taken")
    end

    it "should fails if user is not provided" do
      @user = FactoryGirl.create :user

      @participant = Participant.new(user: @user, project: nil)
      expect(@participant.save).to eq(false)
      expect(@participant.errors[:project].first).to eq("can't be blank")
    end
  end
end
