class User::ReviewsController < ApplicationController

  def create
    shop = Shop.find(params[:shop_id])
    review = current_user.reviews.new(review_params)
    review.shop_id = shop.id
    review.save
    redirect_to user_shop_path(shop)
  end

  private

    def review_params
      params.require(:review).permit(:shop_id, :user_id, :title, :content, :star)
    end

end
