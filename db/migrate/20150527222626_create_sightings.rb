class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :latitude
      t.string :Decimal
      t.string :longitude
      t.string :Decimal
      t.string :datetime

      t.timestamps null: false
    end
  end
end
