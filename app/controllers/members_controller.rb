class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  def index
    @members = policy_scope(Member).order(created_at: :desc)
  end

  def show
  end

  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
    authorize @member
  end

  def create
    @team = Team.find(params[:team_id])
    @member = Member.new(team: @team, user: current_user, project_owner: false, status: "pending" )
    @member.team = Team.find(params[:team_id])
    @member.save
    authorize @member
    redirect_to team_path(@member.team)
  end

  def edit
  end

  def update
    authorize @member
    @member.status = params[:member][:status]
    @member.save
  end

  def destroy
    authorize @member
    @member.destroy
  end

  private

  def member_params
    params.require(:member).permit(:project_owner, :status, :message)
  end

  def set_member
    @member = Member.find(params[:id])
     authorize @member
  end

end
