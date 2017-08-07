class CreateCasts < ActiveRecord::Migration[4.2]
  def change
    create_table :casts do |t|
      t.string :episode
      t.string :releasedate
      t.text :description
      t.text :embedcode
      
      t.timestamps null: false
    end
    add_index :casts, :episode, unique: true
  end
end
