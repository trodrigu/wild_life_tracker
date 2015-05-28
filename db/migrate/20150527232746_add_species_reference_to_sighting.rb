class AddSpeciesReferenceToSighting < ActiveRecord::Migration
  def change
    change_table :sightings do |t|
      t.references :species
    end
  end
end
