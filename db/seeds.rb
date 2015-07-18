# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sighting.delete_all
Species.delete_all
User.delete_all

species = ['Dog', 'Cat', 'Lizard', 'Bird']
locations = ['Poway', 'Escondido', 'Fallbrook', 'Solana Beach']
users = []
8.times do |i|
  password = 'password'
  email = Faker::Internet.email
  user = User.create(email: email, password: password, password_confirmation: password)
  users.push(user)

end
# Make sure to have jpg assets numbered 138 - 146 in app/assets/images/
@i = 138
species.each do |s|
  locations.each do |l|
    new_species = Species.create(name: s)
    Sighting.create( species_id: new_species.id, location: l)
    SpeciesPic.create( species_id: new_species.id, avatar: File.new("#{Rails.root}/app/assets/images/#{@i}.jpg"), user_id: users.sample.id )
    @i += 1 unless @i == 146
  end
end

