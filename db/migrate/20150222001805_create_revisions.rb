class CreateRevisions < ActiveRecord::Migration[4.2]
  def change
    create_table :revisions do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
