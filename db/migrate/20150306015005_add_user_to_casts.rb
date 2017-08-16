class AddUserToCasts < ActiveRecord::Migration[4.2]
  def change
    add_reference :casts, :user, index: true
    add_foreign_key :casts, :users
  end
end
