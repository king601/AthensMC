class AddFieldsToWhitelistRequests < ActiveRecord::Migration
  def change
    add_column :whitelist_requests, :referred_by, :string
  end
end
