# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |i| "kvirani#{i}" }
    sequence(:email) { |i| "kvirani#{i}@gmail.com"}
    first_name "Khurram"
    last_name "Virani"
    password "lighthouselabs"
    password_confirmation "lighthouselabs"
  end
end
