class RemoveColumnsFromSightings < ActiveRecord::Migration
  def up
    remove_column :sightings, :Decimal
    remove_column :sightings, :datetime
  end

end
