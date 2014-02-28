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
      @order_item = @order.order_items
    end

    def checkout
    end

    def confirm
      @order = Order.find(session[:order_id])
      @order.update(status: "completed")
      session[:order_id] = nil
      redirect_to :order_fulfillment
    end

    def confirmation
      @old_order = @order
      # @order = Order.new
      # @order.user_id = @current_user.id if @current_user
      # @order.save
      # session[:order_id] = @order.id
    end

    def add_to_cart
      @order_item = OrderItem.new(product_id: params[:product], order_id: @order.id, quantity: params[:order_item][:quantity])
      @order_item.save
      redirect_to cart_path
    end

    def update_cart
      @order_item = OrderItem.find(params[:order_item][:order_item_id])
      @order_item.quantity   = params[:order_item][:quantity]
      @order_item.save
      render :cart
    end

    def add_billing_info
      @order.email          = params[:email]
      @order.street_address = params[:street_address]
      @order.city           = params[:city]
      @order.state          = params[:state]
      @order.country        = params[:country]
      @order.name_on_cc     = params[:name_on_cc]
      @order.cc_number      = params[:cc_number]
      @order.cc_expiration  = params[:cc_expiration]
      @order.cc_cvv         = params[:cc_cvv]
      @order.billing_zip    = params[:billing_zip]
      @order.save

      # session[:order_id] = nil
      redirect_to confirmation_path
    end

  private
  def find_cart
    # begin find_cart

    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      if @current_user
        @order = Order.where(user_id: @current_user.id).where(status: "pending")
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

