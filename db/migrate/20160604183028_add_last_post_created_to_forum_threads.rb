class AddLastPostCreatedToForumThreads < ActiveRecord::Migration
  def change
    add_column :forum_threads, :last_post_created_at, :datetime
  end
end
