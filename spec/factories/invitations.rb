# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    sequence(:email) { |i| "invitation#{i}@example.com" }
    association :inviter, factory: :user
    project
  end
end
