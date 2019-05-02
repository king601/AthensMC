class AddMissingIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :notifications, :actor_id
    add_index :notifications, :recipient_id
    add_index :notifications, %i[notifiable_id notifiable_type]
    add_index :whitelist_requests, :actor_id
  end
end
