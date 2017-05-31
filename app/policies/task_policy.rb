class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

   def create?
    record.team.members.where(project_owner: true).first.user == user
   end

  def new?
    create?
  end

  def update?
    record.team.members.where(project_owner: true).first.user == user
  end

  def edit?
    update?
  end

  def destroy?
   record.team.members.where(project_owner: true).first.user == user
  end

  def mark_as_done?
    record.team.members.where(project_owner: true).first.user == user
  end
end
