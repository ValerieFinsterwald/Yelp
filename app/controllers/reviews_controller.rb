class ReviewsController < ApplicationController
  def create
    @review = Review.new(params_review)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end

end
