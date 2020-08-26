class PlatformPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user.admin
  end

  def edit?
    user.admin
  end

  def update?
    user.admin
  end

  def new?
    user.admin
  end

  def create?
    user.admin
  end
end
