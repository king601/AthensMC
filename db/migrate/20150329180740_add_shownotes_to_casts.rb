class AddShownotesToCasts < ActiveRecord::Migration[4.2]
  def change
    add_column :casts, :shownotes, :text
  end
end
