class AddBelongsToToSpeciesPics < ActiveRecord::Migration
  def change
    add_reference :species_pics, :species, index: true, foreign_key: true
  end
end
