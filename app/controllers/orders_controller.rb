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
      # @order = Order.new

      # begin find_cart
      if session[:order_id]
        @order = Order.find(session[:order_id])
      else
        if @current_user
          @order = Order.where(user_id: @current_user.id).where(pending: true)
        end
      end

      if @order.nil?
        @order = Order.new
        @order.user_id = @current_user.id if @current_user
        @order.save     
      end

      session[:order_id] = @order.id
      # end find_cart

      # add_item_to_order(order = @order) EXAMPLE SAMPLE
      @order_item = OrderItem.new
      @order_item.product_id = params[:product]
      @order_item.order_id   = @order.id
      @order_item.quantity   = params[:order_item][:quantity] || 1
      @order_item.save

      redirect_to product_path(params[:product])
    end

      # if Order.pending
      #   @order = Order.pending
      # else
      #   @order = Order.new

# update cart amount
    # def update_cart
    #   @order = Order.pending
    #   @order.add_items_to_cart(params[:orders][:products])
    # end
  

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
    order.order_items << Product.find(product_id)
      # p = Product.find(product_id)
      # o = OrderItem.new 
      # o.product = p
  end
end

# find a product by the product_id
# make that product an order item
# put that order item into cart 




