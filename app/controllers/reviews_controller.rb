class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @reviewproduct = Product.find(params[:product_id])
    @review = @reviewproduct.reviews.create(review_params)
    @review.user = current_user
    @review.save
    if @review.save
      redirect_to @reviewproduct, notice: 'Review created!'
    else
      redirect_to @reviewproduct, notice: 'You need to add text'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.id == @review.user_id
      @review.destroy
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
