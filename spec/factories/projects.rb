# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:name) { |i| "Project #{i}" }
    description Faker::Lorem.sentence(20)
    association :owner, factory: :user
  end
end
