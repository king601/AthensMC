class CreateWhitelistRequests < ActiveRecord::Migration
  def change
    create_table :whitelist_requests do |t|
      t.references :user, index: true
      t.string :status
      t.boolean :agree_rules
      t.datetime :approved_on
      t.datetime :denied_on

      t.timestamps null: false
    end
    add_foreign_key :whitelist_requests, :users
  end
end
