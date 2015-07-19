class Sighting < ActiveRecord::Base
  validates :location, presence: true
  belongs_to :species, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: -> (obj){ obj.location.present? and obj.location_changed? }
end
