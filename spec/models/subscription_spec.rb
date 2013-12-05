require 'spec_helper'

describe Subscription do
  context "Validation" do
    it "is invalid if user is empty" do
      @sub = FactoryGirl.build :subscription, user: nil
      expect(@sub).to_not be_valid
      expect(@sub.errors[:user].first).to eq("can't be blank")
    end
    it "is invalid if start_date is empty" do
      @sub = FactoryGirl.build :subscription, start_date: nil
      expect(@sub).to_not be_valid
      expect(@sub.errors[:start_date].first).to eq("can't be blank")
    end
    # it "is invalid to have two subscriptions belonging to the same user" do
    #   @user = FactoryGirl.create :user
    #   @sub = FactoryGirl.create :subscription, user: @user
    #   @second_sub = FactoryGirl.create :subscription, user: @user
    #   expect(@second_sub).to_not be_valid
    # end
  end
end
