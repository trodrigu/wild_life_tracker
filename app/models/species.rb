class Species < ActiveRecord::Base
  has_many :sightings
  has_many :species_pics
  validates :name, presence: true

end
