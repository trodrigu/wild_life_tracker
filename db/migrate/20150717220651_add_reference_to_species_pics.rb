class AddReferenceToSpeciesPics < ActiveRecord::Migration
  def change
    add_reference :species_pics, :user, index: true, foreign_key: true
  end
end
