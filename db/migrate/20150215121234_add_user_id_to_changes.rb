class AddUserIdToChanges < ActiveRecord::Migration
  def change
    add_column :changes, :user_id, :interger
    add_index :changes, :user_id
  end
end
