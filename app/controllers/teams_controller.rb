class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
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
    @team = Team.new(team_params)
    @team.user = current_user
    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def update
  end

  def edit
    @team.update(params[:team])
  end


  def destroy #Add Condition With Owner !!!
    @team.destroy
    redirect_to user_path(current_user)
  end


  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:description, :title, :total_members, :theme, :art_types, :budget,
      :date, :location, :mail, :photo)
  end
end
