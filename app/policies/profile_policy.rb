class ProfilePolicy < ApplicationPolicy
  def show?
    true
  end

  def add_friend?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
