class AddSlugToCast < ActiveRecord::Migration[4.2]
  def change
    add_column :casts, :slug, :string
  end
end
