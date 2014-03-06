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

    def update
        @order.update(shipping_cost: params[:order][:shipping_cost] = params[:order][:shipping_cost].split("$").last.to_f)
        if @order.save
          respond_to do |format|
            format.html {redirect_to :back}
            format.json {render json: @order}
          end
        end
    end

    def cart
    end

    def checkout
    end

    def confirmation
      if @order.shipping_ops
        @shipping = @order.shipping_ops
      else
        flash.now[:notice] = "You've entered an incorrect value. Please check the form."
        render :checkout
      end
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
      @order.update(order_params)
      if @order.save
        redirect_to confirmation_path
      end
    end

    def confirm
      @order.update(status: "completed")
      if @order.save
        session[:order_id] = nil
        redirect_to :order_fulfillment
      else
        render :confirmation, notice: "Something went wrong."
      end
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

  def order_params
    params.require(:order).permit(:email, :street_address, :city, :state, :country, :name_on_cc, :cc_number, :cc_expiration, :cc_cvv, :billing_zip, :shipping_cost)
  end
end

