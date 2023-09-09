class Admin::ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    tags = Vision.get_image_data(shop_params[:image])
    if @shop.save
      tags.each do |tag|
        @shop.tags.create(name: tag)
      end
      redirect_to admin_shops_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
  end

  def index
    @shops = Shop.all
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :phone, :first_hour, :first_min, :end_hour, :end_min, :closed, :access, :parking, :remarks, :image)
  end


end
