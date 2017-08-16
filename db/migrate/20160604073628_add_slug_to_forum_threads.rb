class AddSlugToForumThreads < ActiveRecord::Migration[4.2]
  def change
    add_column :forum_threads, :slug, :string
    add_index :forum_threads, :slug, unique: true
  end
end
