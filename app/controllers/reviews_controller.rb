class ReviewsController < ApplicationController

  def create
    reviewproduct = Product.find(params[:product_id])
    @review = reviewproduct.reviews.create(review_params)
    @review.user = current_user
    @review.save
    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
