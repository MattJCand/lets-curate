class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.teams.include?(record) && user.members.where(team_id: record.id).first.project_owner == true
  end

  def edit?
    update?
  end

  def destroy?
    user.teams.include?(record) && user.members.where(team_id: record.id).first.project_owner == true
  end

  def dashboard?
    user.teams.include?(record)
  end
end
