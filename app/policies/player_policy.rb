class PlayerPolicy < ApplicationPolicy

  def create?
    true
  end

  def join_team?
    true
  end


  def update?
    user.id == record.user_id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
