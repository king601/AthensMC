class AddUserToCasts < ActiveRecord::Migration
  def change
    add_reference :casts, :user, index: true
    add_foreign_key :casts, :users
  end
end
