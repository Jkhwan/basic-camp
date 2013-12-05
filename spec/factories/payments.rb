# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    subscription
    amount 800
    paid_at Time.now
  end
end
