class ProfilePolicy < ApplicationPolicy

  def show?
    true
  end

  def add_friend?
    true
  end

  def accept_friend?
    true
  end

  def decline_friend?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
