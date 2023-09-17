class User::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    tags = Vision.get_image_data(user_params[:profile_image])
    if @user.update(user_params)
      tags.each do |tag|
        @user.tags.create(name: tag)
      end
      redirect_to user_user_path(current_user)
    else
      redirect_to request.referer
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end

end
