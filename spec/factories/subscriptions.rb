# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    user
    start_date { Date.today }
    last_payment_date nil
    factory :subscription_one_month_ago do
      last_payment_date Date.today.advance(months: -1)
    end
    factory :subscription_two_days_ago do
      last_payment_date Date.today.advance(days: -2)
    end
  end
end
