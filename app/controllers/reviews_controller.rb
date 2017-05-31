class ReviewsController < ApplicationController
   before_action :set_review, only: [:show, :edit, :update, :destroy]

  def show
    @member = Member.find(params[:id])
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def set_review
    @review = Review.find(params[id])
  end
end
