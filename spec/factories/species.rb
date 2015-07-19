# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :species do
    id 1
    name { Faker::Team.creature }
  end
end
