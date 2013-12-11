class RmIdsFromOrderItems < ActiveRecord::Migration
  def change
    remove_columns(:order_items, :product_id, :order_id)
  end
end
