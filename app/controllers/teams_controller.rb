class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
  end

  def create
    @team.member.project_owner = true
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def team_params
    params.require(:team).permit(:description, :title, :total_members, :theme, :art_types, :budget,
      :date, :location, :mail, :photo)
  end

end
