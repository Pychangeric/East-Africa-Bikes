class ReviewsController < ApplicationController
    before_action :set_bike
  
    def new
      @review = Review.new
    end
  
    def create
      @review = @bike.reviews.new(review_params)
      if @review.save
        redirect_to @bike, notice: 'Review was successfully posetd.'
      else
        render :new
      end
    end
  
    private
  
    def set_bike
      @bike = Bike.find(params[:bike_id])
    end
  
    def review_params
      params.require(:review).permit(:author, :rating, :comments)
    end
  end
  