FactoryGirl.define do
  factory :sighting do
    location { Faker::Address.city }

    factory :invalid_sighting do
      location nil
    end
  end
end
