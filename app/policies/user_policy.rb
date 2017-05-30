class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?

  end

  def update?

  end

  def edit?
    update?
  end
end
