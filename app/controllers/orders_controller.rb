class OrdersController < ApplicationController

  before_action :set_user, only: [:show] 
    #:update, :destroy add later so that the user can cancel or update order before it ships
    
    def index
      @orders = Order.all
    end

    def show
      @orders = Order.all
    end
  end
end


