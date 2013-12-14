class CategoriesController < ApplicationController
	def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    @category = Category.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    
  end

  # POST /products
  def create
 
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'category was successfully created.' 
    else
      render 'new' 
    end
  end

  # PATCH/PUT /categories/1
  def update
    
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to products_url
  end

  private

  def set_product
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:categories).permit(:name) 
  end
end

