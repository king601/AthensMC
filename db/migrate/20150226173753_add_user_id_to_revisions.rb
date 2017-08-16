class AddUserIdToRevisions < ActiveRecord::Migration[4.2]
  def change
    add_column :revisions, :user_id, :integer
    add_index :revisions, :user_id
  end
end
