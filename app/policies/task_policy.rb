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
end
