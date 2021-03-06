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
    # @task.member = @project_owner
    @task.member = Member.find(params[:task][:member])
    authorize(@task)
    @task.save
    # redirect_to dashboard_team_path(@team, step: "step3")
  end

  def edit
    @task = Task.find(params[:id])
    authorize(@task)
  end

  def update
    @task = Task.find(params[:id])
    authorize(@task)
    @task.update(task_params)
    redirect_to dashboard_team_path(@task.team)
  end

  def destroy
    @task = Task.find(params[:id])
    authorize(@task)
    @task.destroy
    redirect_to dashboard_team_path(@task.team)
  end

  def mark_as_done
    @task = Task.find(params[:id])
    @task.status = true
    authorize(@task)
    @task.save
    respond_to do |format|
      format.html { redirect_to dashboard_team_path(@task.team) }
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
