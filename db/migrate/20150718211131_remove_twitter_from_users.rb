class RemoveTwitterFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :twitter
  end
end
