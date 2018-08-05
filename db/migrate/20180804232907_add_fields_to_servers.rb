class AddFieldsToServers < ActiveRecord::Migration[5.1]
  def change
    add_column(:servers, :ssh_username, :string)
    add_column(:servers, :ssh_public_key, :text)
    add_column(:servers, :encrypted_ssh_private_key, :text)
    add_column(:servers, :encrypted_ssh_private_key_iv, :string)
    add_column(:servers, :directory, :string)
  end
end
