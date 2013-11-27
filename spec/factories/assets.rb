# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    project
    user
    file "http://octodex.github.com/images/labtocat.png"
  end
end
