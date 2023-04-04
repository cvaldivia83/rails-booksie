class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(super_booksie: true)
    end
  end

  def show?
    true
  end

  def super_booksie?
    true
  end
end
