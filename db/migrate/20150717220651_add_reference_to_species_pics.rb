class AddReferenceToSpeciesPics < ActiveRecord::Migration
  def change
    add_column :species_pics, :user_id, :reference
  end
end
