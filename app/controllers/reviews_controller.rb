class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.all.each do |review|
      if review.user_id == current_user.id
        flash[:notice] = "Can only review restaurant once"
        redirect_to '/'
        return
      end
    end
    @restaurant.reviews.create(review_params)
    redirect_to restaurants_path
  end

  def review_params
    p '---' * 10
    x = params.require(:review).permit(:thoughts, :rating)
    x['user_id'] = current_user.id
    p x
    x
  end
end
