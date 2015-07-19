FactoryGirl.define do
  factory :species_pic do
    avatar { Faker::Avatar.image }
    id 1
    user_id 1
    species_id 1

    factory :invalid_species_pic do
      avatar nil
    end
  end
end
