class CreateMapDownloads < ActiveRecord::Migration[4.2]
  def change
    create_table :map_downloads do |t|
      t.string :name
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
