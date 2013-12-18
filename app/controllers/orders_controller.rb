class OrdersController < ApplicationController

  before_action :set_user, only: [:show] 
  before_action :find_cart
    #:update, :destroy add later so that the user can cancel or update order before it ships
    
    def index
      @orders = Order.all
    end

    def show
      @orders = Order.all
    end

    def cart
     
    end

    def add_to_cart

      # add_item_to_order(order = @order) EXAMPLE SAMPLE
      @order_item = OrderItem.new
      @order_item.product_id = params[:product]
      @order_item.order_id   = @order.id
      @order_item.quantity   = params[:order_item][:quantity] || 1
      @order_item.save
      redirect_to product_path(params[:product])
    end


    def update_cart
      @order_item = OrderItem.where(id: params[:order_item])
      @order_item.quantity   = params[:order_item][:quantity] || 1
      @order_item.save
    
    end

  private

def find_cart
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
    end
end

