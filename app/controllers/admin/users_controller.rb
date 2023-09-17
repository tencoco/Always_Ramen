class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_users_path
  end

end
