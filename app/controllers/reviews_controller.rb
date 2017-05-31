class ReviewsController < ApplicationController
   before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @member = Member.find(params["member_id"])
    @review = Review.new(reviewee_id: @member.id)
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @member = Member.find(params["member_id"])
    @review.reviewer_id = current_user
    @review.reviewee_id = @member
    authorize @review
    @review.save
    redirect_to member_path(@member)
  end

  def edit
  end

  def update
    authorize @review
    @member = Member.find(params["member_id"])
    @review.update(member)
    redirect_to member_path(@review)
  end

  def delete
    authorize @review
    @review.destroy
    redirect_to member_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
