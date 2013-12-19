module OrdersHelper

  def order_item_subtotal(order_item)
    order_item_subtotal = order_item.quantity * order_item.price
  end
  
end
