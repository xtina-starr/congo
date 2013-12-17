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
     
    end

    def create
      @order = Order.new
      @user_cart = @users.cart #based on @users described in users controller. Should be singular.
      if @user_cart.cart_items.empty?
        redirect_to @users.cart, notice: 'Your cart is empty.' #need to look at again later.
      else
        @user_cart.cart_items.each do |cart_item|
          new_order_item = OrderItem.new
          new_order_item.quantity = cart_item.quantity
          new_order_item.product_id = cart_item.product_id
          # Not sure if we have to associate the order_id (new_order_item.order_id = @order.id)
          @order.order_items << new_order_item 
        end
      end
    end
end



