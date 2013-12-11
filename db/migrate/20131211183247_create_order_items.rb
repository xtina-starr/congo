class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.product_id :integer
      t.order_id :integer

      t.timestamps
    end
  end
end
