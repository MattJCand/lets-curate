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
    redirect_to member_path(@project_owner)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
