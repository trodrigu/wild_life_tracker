FactoryGirl.define do
  factory :sighting do
    date { Faker::Date.between(2.days.ago, Date.today).strftime("%Y-%m-%d") }
    location { Faker::Address.city }

    factory :invalid_sighting do
      date { Faker::Date.between(2.days.ago, Date.today).strftime("%Y-%m-%d") } 
      location nil
    end
  end
end
