class AddLocationToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :location, :string
  end
end
