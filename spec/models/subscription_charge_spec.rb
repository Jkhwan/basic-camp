require 'spec_helper'

describe SubscriptionCharge do

  before :each do
    allow_any_instance_of(Subscription).to receive(:start_subscription)
    @sub = FactoryGirl.create :subscription
    @sub_charge = SubscriptionCharge.new(@sub)
  end
  
  it "should attempt a charge through Stripe" do
    @stripe_charge_success = double( paid: true )
    expect(Stripe::Charge).to receive(:create).with(
      amount: 800,
      currency: "cad",
      customer: @sub.user.customer_token).and_return(@stripe_charge_success)
    @sub_charge.charge!
  end
  context "#charge!" do
    context "Success" do
      before :each do
        @stripe_charge_success = double( paid: true )
        expect(Stripe::Charge).to receive(:create).once.and_return(@stripe_charge_success)
      end
      it "should set last_payment_date to today" do
        @sub_charge.charge!
        expect(@sub.last_payment_date).to eq(Date.today)
      end
      it "should set next_payment_date to 30 days from the current next_payment_date" do
        @npd = @sub.next_payment_date
        @sub_charge.charge!
        expect(@sub.next_payment_date).to eq(@npd.advance(months: 1))
      end
      it "should create a new payment" do
        @sub_charge.charge!
        expect(@sub.payments.count).to eq(1)
      end
      it "should set the paid at date of new payment to today" do
        Timecop.freeze(Time.now)
        @sub_charge.charge!
        expect(@sub.payments.first.paid_at.to_f.round(2)).to eq(Time.now.to_f.round(2))
      end
    end
    context "Failure" do
      it "should not have set last_payment_date" do
        expect(Stripe::Charge).to receive(:create).and_raise(Stripe::CardError.new("", "", ""))
        @sub_charge.charge!
        expect(@sub.last_payment_date).to eq(nil)
      end
    end
  end
end
