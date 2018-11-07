class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
    # redirect_to review_path(@review)
  end

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end
end
