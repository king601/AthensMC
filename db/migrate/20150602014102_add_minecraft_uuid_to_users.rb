class AddMinecraftUuidToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :minecraft_uuid, :string
  end
end
