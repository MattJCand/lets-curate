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
      Member.create!(team: @team, user: current_user, project_owner: true, status: "accepted")
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update(team_params)

    respond_to do |format|
      format.html { redirect_to dashboard_team_path(@team) }
      format.js
    end

  end

  def destroy
    @team.destroy
    redirect_to user_path(current_user)
  end

#DASHBOARD METHODS

  def dashboard
    @team = Team.find(params[:id])
    @task = Task.new(member: @member, team: @team)
    authorize @team
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "dashboard", layout: false   # Excluding ".pdf" extension.
          end
        end
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
