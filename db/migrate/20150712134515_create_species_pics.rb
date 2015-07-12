class CreateSpeciesPics < ActiveRecord::Migration
  def change
    create_table :species_pics do |t|
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
