class AddShownotesToCasts < ActiveRecord::Migration
  def change
    add_column :casts, :shownotes, :text
  end
end
