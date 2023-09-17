class User::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @review = @shop.reviews
  end

  def create
    @shop = Shop.find(params[:id])
    @review = @shop.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      @shop = Shop.find(params[:id])
      redirect_to user_shops_path
    else
      render :show
    end
  end

  private

    def review_params
      params.require(:review).permit(:shop_id, :user_id, :title, :content, :star)
    end
end
