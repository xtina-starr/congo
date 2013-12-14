class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  mount_uploader :image, ImageUploader
  # GET /products

  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    # used for showing all reviews:
    @reviews = @product.reviews
    # used for the new review form:
    @review = Review.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    
  end

  # POST /products
  def create
 
  @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'thing was successfully created.' 
    else
      render 'new' 
    end
  end

  # PATCH/PUT /products/1
  def update
    
    if @product.update(product_params)
      redirect_to @product, notice: 'product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :stock) 
  end
end