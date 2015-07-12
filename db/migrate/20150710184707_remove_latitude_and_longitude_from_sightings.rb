class RemoveLatitudeAndLongitudeFromSightings < ActiveRecord::Migration
  def change
    remove_column :sightings, :longitude
    remove_column :sightings, :latitude
  end
end
