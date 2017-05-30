class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

   def create?
    user.members.project_owner?
   end

  def new?
    create?
  end
end
