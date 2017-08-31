class AddForumPostsCountToForumThreads < ActiveRecord::Migration[5.1]
  def up
    add_column :forum_threads, :forum_posts_count, :integer
    ForumThread.find_each { |thread| ForumThread.reset_counters(thread.id, :forum_posts) }

    ForumThread.reindex
  end

  def down
    remove_column :forum_threads, :forum_posts_count
  end
end
