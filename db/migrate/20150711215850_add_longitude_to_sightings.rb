class AddLongitudeToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :longitude, :float
  end
end
