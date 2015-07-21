class ChangeDateLongitudeAndLatitude < ActiveRecord::Migration
  def change
    change_column :sightings, :latitude, :decimal
    change_column :sightings, :longitude, :decimal
  end
end
