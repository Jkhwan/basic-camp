# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invitation do
    sequence(:email) { |i| "invitation#{i}@example.com" }
    token "1234567890"
    project
  end
end
