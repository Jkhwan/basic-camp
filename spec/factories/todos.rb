# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    name "Todo"
    due_date Date.today + 3
    importance 3
    completed false
    project
  end
end
