class UpdateStatusInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :status, :string, :default => "pending"
  end
end
