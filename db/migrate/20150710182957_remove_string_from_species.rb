class RemoveStringFromSpecies < ActiveRecord::Migration
  def change
    remove_column :species, :String
  end
end
