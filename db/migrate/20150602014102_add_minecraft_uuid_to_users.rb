class AddMinecraftUuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :minecraft_uuid, :string
  end
end
