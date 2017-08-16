class AddFieldsToWhitelistRequests < ActiveRecord::Migration[4.2]
  def change
    add_column :whitelist_requests, :referred_by, :string
  end
end
