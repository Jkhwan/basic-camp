require 'spec_helper'

describe Tasks::DailyRebiller do
  let(:daily_rebiller) { Tasks::DailyRebiller.new }
  context "#run" do
    before :each do
      allow_any_instance_of(Subscription).to receive(:start_subscription)
    end
    it "should charge all subscriptions that have a last_payment_date " do
      FactoryGirl.create :subscription_one_month_ago
      fake_subscription_charge = double(:charge! => nil)
      expect(fake_subscription_charge).to receive(:charge!).once
      expect(SubscriptionCharge).to receive(:new).once.and_return(fake_subscription_charge)
      daily_rebiller.run
    end
    it "does not perform a subscription charge for one that was charged less than a month ago" do
      FactoryGirl.create :subscription_two_days_ago
      expect(SubscriptionCharge).to_not receive(:new)
      daily_rebiller.run
    end
  end
end
