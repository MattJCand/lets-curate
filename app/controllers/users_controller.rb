class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @teams = current_user.teams
    unless @user.photos.empty?
      @first_photo_path = @user.photos.first.path
    end
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

  def dashboards
    @user = current_user
    @teams = @user.teams
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :city, :art_types, :description, :avatar, photos: [])
  end
end
