class AddStickyToForumThreads < ActiveRecord::Migration
  def change
    add_column :forum_threads, :sticky, :boolean, default: false
  end
end
