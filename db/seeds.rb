# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Species.delete_all
Sighting.delete_all

species = ['dog', 'cat', 'lizard', 'bird']
locations = ['Poway', 'Escondido', 'Fallbrook', 'Solana Beach']

species.each do |s|
  locations.each do |l|
    new_species = Species.create(name: s)
    Sighting.create( species_id: new_species.id, location: l)
  end
end


