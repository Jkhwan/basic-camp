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
    it "is valid to have multiple payments" do
      allow_any_instance_of(Subscription).to receive(:start_subscription)
      allow(Stripe::Charge).to receive(:create).and_return(true)
      @sub = FactoryGirl.create :subscription
      @sub.payments.create(amount: 800, paid_at: Time.now)
      @sub.payments.create(amount: 1000, paid_at: Time.now) 
      expect(@sub).to be_valid
      expect(@sub.payments.count).to eq(2)
    end
    it "should have a start date equal to today" do
      @sub = Subscription.new
      expect(@sub.start_date).to eq(Date.today)
    end
    it "should have a next payment date equal to same date of next month" do
      @sub = Subscription.new
      expect(@sub.next_payment_date).to eq(Date.today.advance(months: 1))
    end
  end
  context "#start_subscription" do
    it "returns false if failed" do
      @user = FactoryGirl.create :user
      allow(Stripe::Charge).to receive(:create).and_raise(Stripe::CardError.new("", "", ""))
      @sub = Subscription.create(user: @user)
      expect(@sub).to be_a_new(Subscription)
    end
    it "throws error if failed" do
      @user = FactoryGirl.create :user
      allow(Stripe::Charge).to receive(:create).and_raise(Stripe::CardError.new("", "", ""))
      @sub = Subscription.create(user: @user)
      expect(@sub.errors[:base].first).to eq("Failed payment")
    end
  end
end
