class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :ip
      t.string :game_port
      t.string :integer
      t.integer :rcon_port
      t.integer :query_port
      t.string :rcon_password

      t.timestamps
    end
  end
end
