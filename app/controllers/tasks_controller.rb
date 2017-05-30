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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to member_path(@task.member)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to member_path(@task.member)
  end

  def mark_as_done
    @task = Task.find(params[:id])
    @task.status = true
    @task.save
    redirect_to member_path(@task.member)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
