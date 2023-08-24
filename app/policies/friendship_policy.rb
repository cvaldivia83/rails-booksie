class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def followers?
    true
  end

  def followings?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    record.asker == user || record.receiver == user
  end

  # def followers?
  #   record.receiver == user
  # end
end
