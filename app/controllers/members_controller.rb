class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  def index
    @members = policy_scope(Member).order(created_at: :desc)
  end

  def show
    @member = Member.find(params[:id])
    @team = @member.team
    @task = Task.new(member: @member, team: @team)
    authorize @member
  end

  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
    authorize @member
  end

  def create
    @member = Member.new(member_params)
    @member.team = Team.find(params[:team_id])
    @member.save
    authorize @member
  end

  def edit
  end

  def update
    authorize @member
  end

  def destroy
    authorize @member
    @member.destroy
  end

  private

  def member_params
    params.require(:member).permit(:project_owner, :status)
  end

  def set_member
    @member = Member.find(params[:id])
     authorize @member
  end

end
