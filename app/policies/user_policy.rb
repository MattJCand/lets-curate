class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def update?
    record == user
  end

  def edit?
    update?
  end

  def dashboards?
    true
  end
end
