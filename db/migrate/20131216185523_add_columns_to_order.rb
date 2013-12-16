class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pending, :boolean
    add_column :orders, :shipped, :boolean
    add_column :orders, :cancelled, :boolean

    drop_table :carts
    drop_table :cart_items
  end
end
