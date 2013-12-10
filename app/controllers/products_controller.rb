class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products

  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @products = Product.new
  end

  # GET /products/1/edit
  def edit
    
  end

  # POST /products
  def create
  
  @products = Product.new(product_params)

    if @products.save
      redirect_to @products, notice: 'product was successfully created.' 
    else
      render 'new' 
    end
  end

  # PATCH/PUT /products/1
  def update
    
    if @products.update(product_params)
      redirect_to @products, notice: 'product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    @products.destroy
    redirect_to products_url
  end

  private

  def set_product
    @products = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price) 
  end
end