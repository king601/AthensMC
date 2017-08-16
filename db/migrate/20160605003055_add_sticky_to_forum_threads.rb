class AddStickyToForumThreads < ActiveRecord::Migration[4.2]
  def change
    add_column :forum_threads, :sticky, :boolean, default: false
  end
end
