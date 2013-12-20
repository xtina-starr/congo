class CategoriesController < ApplicationController
	def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
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
      redirect_to "/#{@category}", notice: 'Category was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to '/categories'
  end

  private

  def set_product
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :products => {}) 
  end
end

