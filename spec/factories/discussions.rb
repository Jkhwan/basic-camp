# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discussion do
    user
    project
    subject "Discussion Topic"
    content "Discussion content........."
  end
end
