class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to restaurants_path
  end

  def review_params
    combined_params = params.require(:review).permit(:thoughts, :rating)
    combined_params['user_id'] = current_user.id
    combined_params
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = 'Review deleted successfully'
    redirect_to restaurants_path
  end

  def verify_creator(review)
    unless created_by_current_user(review)
      flash[:notice] = "You may only delete a review that you added"
      redirect_to restaurants_path
    end
  end

  def created_by_current_user(review)
    review.user_id == current_user.id
  end
end
