# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    user
    start_date { Date.today }
    last_payment_date nil
  end
end
