class RemoveDateFromSightings < ActiveRecord::Migration
  def change
    remove_column :sightings, :date
  end
end
