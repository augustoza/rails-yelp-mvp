class RestaurantsController < ApplicationController
  before_action :params_searcher, only: %i[show avg_rating]
  def index
    @restaurants = Restaurant.all
  end

  def avg_rating
    sum = 0
    @restaurant.reviews.each do |review|
      sum += review.rating
    end
    sum /= @restaurant.reviews.length.to_f
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurant_path(@restaurant)
  end

  def show
    @avg = avg_rating.round(2)
  end

  private

  def params_searcher
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address)
  end
end
