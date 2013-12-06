require 'spec_helper'

describe Tasks::DailyRebiller do
  let(:daily_rebiller) { Tasks::DailyRebiller.new }
  context "#one_month_ago" do
    it "returns a date one month ago" do
      expect(daily_rebiller.one_month_ago).to eq(Date.today.advance(months: -1))
    end
  end
  context "#find_subscriptions_for_billing" do
    it "returns all subscriptions with last_payment_date 30 or more days ago" do
      one_month_ago = Date.today.advance(months: -1)
      @sub_past = FactoryGirl.create :subscription, last_payment_date: one_month_ago.advance(days: -2)
      @sub_future = FactoryGirl.create :subscription, last_payment_date: one_month_ago.advance(days: 2)
      @sub_today = FactoryGirl.create :subscription, last_payment_date: one_month_ago
      expect(daily_rebiller.find_subscriptions_for_billing).to eq([@sub_past, @sub_today])
    end
  end
  context "#run" do
    it "should charge all subscriptions that have a last_payment_date " do
      @stripe_charge_success = double( paid: true )
      expect(Stripe::Charge).to receive(:create).and_return(@stripe_charge_success)
      @sub = FactoryGirl.create :subscription, last_payment_date: Date.today.advance(months: -1)
      daily_rebiller.run
      expect(@sub.payments.count).to eq(1)
      expect(@sub.next_payment_date).to eq(Date.today.advance(months: 1))
    end
  end
end
