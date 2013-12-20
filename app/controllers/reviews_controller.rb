class ReviewsController < ApplicationController

# I removed 'index' because we are not allowing users to directly access that path. they must create a review from a product.
	
  def create
    @product = Product.find(params[:product_id])
		@review = @product.reviews.build(review_params)
		 if @review.save
      redirect_to product_path(@product), notice: 'review was successfully created.' 
    else
      redirect_to product_path(@product), notice: 'review was not successfully created. boo!'
    end
	end

	def update  
    @product = Product.find(params[:product_id])
    if @review.update(review_params)
      redirect_to product_path(@product), notice: 'review was successfully updated.'
    else
      render action: 'edit'
    end
	end

	def destroy
		@review.destroy
    redirect_to reviews_url 
	end

private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :text, :rating) 
  end
end
