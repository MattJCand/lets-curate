class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.team = Team.find(params[:team_id])
    @member.save
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
  end

  private

  def member_params
    params.require(:member).permit(:project_owner, :status)
  end

end
