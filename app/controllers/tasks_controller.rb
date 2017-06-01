class TasksController < ApplicationController
    def new
    @team = Team.find(params[:team_id])
    @task = Task.new(team: @team)
    authorize(@task)
    end

  def create
    @task = Task.new(task_params)
    @team = Team.find(params[:team_id])
    @task.team = @team
    @project_owner = @team.members.where(project_owner: 'true').first
    @task.member = @project_owner
    authorize(@task)
    @task.save
    redirect_to dashboard_path(@team)
  end

  def edit
  end

  def update
    @team = Team.find(params[:team_id])
    @task = Task.find(params[:id])
    authorize(@task)
    @task.update(task_params)
    redirect_to dashboard_path(@team)
  end

  def destroy
    @team = Team.find(params[:team_id])
    @task = Task.find(params[:id])
    authorize(@task)
    @task.destroy
    redirect_to dashboard_path(@team)
  end

  def mark_as_done
    @team = Team.find(params[:team_id])
    @task = Task.find(params[:id])
    @task.status = true
    authorize(@task)
    @task.save
    redirect_to dashboard_path(@team)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
