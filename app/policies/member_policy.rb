class MemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
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
    record.where(project_owner: true).first.user == user
  end

  def edit?
    update?
  end

  def destroy?
    record.where(project_owner: true).first.user == user
  end

end
