# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    first_name "Khurram"
    last_name "Virani"
    password "lighthouselabs"
    password_confirmation "lighthouselabs"
  end
end
