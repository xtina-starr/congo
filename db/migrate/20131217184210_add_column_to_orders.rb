class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :user_id, :integer

    remove_column :orders, :pending, :boolean
    remove_column :orders, :shipped, :boolean
    remove_column :orders, :cancelled, :boolean
  end
end
