require 'spec_helper'

describe Project do
  before :each do
    @project = FactoryGirl.build :project
    @user = FactoryGirl.create :user
  end

  context "Creation" do
    it "should add its owner to the participant table upon creation" do
       @project.owner_id = @user.id
       expect(@project.save).to eq(true)
       expect(Participant.count).to eq(1)
       expect(Participant.first.project_id).to eq(@project.id)
       expect(Participant.first.user_id).to eq(@project.owner_id)
    end
  end
  context "Validation" do
    it "should fail if name is not provided" do
      @project.name = nil
      expect(@project.save).to eq(false)
      expect(@project.errors[:name].first).to eq("can't be blank")
    end

    it "should fail if description is not provided" do
      @project.description = nil
      expect(@project.save).to eq(false)
      expect(@project.errors[:description].first).to eq("can't be blank")
    end
  end
end
