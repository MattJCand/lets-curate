class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  #CRUD METHODS

  def index
    @teams = policy_scope(Team).order(created_at: :desc)
  end

  def new
    @team = Team.new
    authorize @team
  end

  def show
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    if @team.save
      Member.create!(team: @team, user: current_user, project_owner: true)
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update(team_params)
    redirect_to dashboard_team_path(@team)
  end

  def destroy
    @team.destroy
    redirect_to user_path(current_user)
  end

#DASHBOARD METHODS

  def dashboard
    @team = Team.find(params[:id])
    @task = Task.new(member: @member, team: @team)
    commontator_thread_show(@team)
    authorize @team
  end

  private

  def set_team
    @team = Team.find(params[:id])
    authorize @team
  end

  def team_params
    params.require(:team).permit(:description, :title, :total_members, :theme, :art_types, :budget,
      :date, :location, :mail, :photo)
  end
end
