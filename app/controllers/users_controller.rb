class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :city, :art_types, :description, :avatar, photos: [])
  end
end
