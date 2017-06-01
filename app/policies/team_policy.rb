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
   record.members.where(project_owner: true).first.user == user
  end

  def edit?
    update?
  end

  def destroy?
    record.members.where(project_owner: true).first.user == user
  end

  def dashboard?
    true
  end
end
