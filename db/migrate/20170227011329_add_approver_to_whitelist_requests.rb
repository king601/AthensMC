class AddApproverToWhitelistRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :whitelist_requests, :actor_id, :integer
  end
end
