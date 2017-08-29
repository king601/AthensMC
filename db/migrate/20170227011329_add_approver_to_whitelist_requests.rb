class AddApproverToWhitelistRequests < ActiveRecord::Migration[4.2]
  def change
    add_column :whitelist_requests, :actor_id, :integer
  end
end
