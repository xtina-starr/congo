class ReviewsController < ApplicationController

	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(params[:id])
		 if @review.save
      redirect_to @review, notice: 'review was successfully created.' 
    else
      render 'new' 
    end
	end

	def update  
    if @review.update(review_params)
      redirect_to @review, notice: 'review was successfully updated.'
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

  def product_params
    params.require(:review).permit(:title, :text, :rating) 
  end
end
