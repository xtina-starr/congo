class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pending, :boolean
    add_column :orders, :shipped, :boolean
    add_column :orders, :cancelled, :boolean

  end
end
