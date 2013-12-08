require 'spec_helper'

describe Payment do
  before :each do
     allow_any_instance_of(Subscription).to receive(:start_subscription)
  end
  context "Validation" do
    let(:payment) { FactoryGirl.build :payment }
    it "is invalid if amount is empty" do
      payment.amount = nil
      expect(payment).to_not be_valid
      expect(payment.errors[:amount].first).to eq("can't be blank")
    end
    it "is invalid if amount is not an integer" do
      payment.amount = "amount"
      expect(payment).to_not be_valid
      expect(payment.errors[:amount].first).to eq("is not a number")
    end
    it "is invalid if paid_at is empty" do
      payment.paid_at = nil
      expect(payment).to_not be_valid
      expect(payment.errors[:paid_at].first).to eq("can't be blank")
    end
    it "is invalid if subscription is empty" do
      payment.subscription = nil
      expect(payment).to_not be_valid
      expect(payment.errors[:subscription].first).to eq("can't be blank")
    end
  end
end
