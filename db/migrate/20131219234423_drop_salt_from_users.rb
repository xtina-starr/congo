class DropSaltFromUsers < ActiveRecord::Migration
  def change
    remove_column :Users, :salt
  end
end
