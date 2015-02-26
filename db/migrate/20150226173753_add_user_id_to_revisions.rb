class AddUserIdToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :user_id, :integer
    add_index :revisions, :user_id
  end
end
