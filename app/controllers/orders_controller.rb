class OrdersController < ApplicationController

  before_action :set_user, only: [:show] 
    #:update, :destroy add later so that the user can cancel or update order before it ships
    
    def index
      @orders = Order.all
    end

    def show
      @orders = Order.all
    end

    def cart
     @order = Order.pending
    end

# endpoint for "buy me" button on product page
    def add_to_cart
      @order = Order.new
      @order.add_items_to_cart(params[:orders][:products])

      redirect to @product
    end

# update cart amount
    def update_cart
      @order = Order.pending
      @order.add_items_to_cart(params[:orders][:products])
    end
  

  # order.order_items.each |orderitem|
  # order.product_id
  # order_items.product.name
  # order_items.quantity

  # .order_items gets specific info like quantity and discount

  # .oi.quantity

  # invoice (order)
  # line items (order items)


  private

  def add_items_to_cart(product_id)
    order_items << Product.find(product_id)

  end
end



