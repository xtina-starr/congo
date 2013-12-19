class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :order_id
      t.integer :price
      t.integer :subtotal

      t.timestamps
    end
  end
end
