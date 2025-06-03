# frozen_string_literal: true

class ClassSessionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.platform_admin? || user.studio_admin? || user.instructor?
  end

  def update?
    user.platform_admin? || user.studio_admin?
  end

  def destroy?
    user.platform_admin?
  end

  class Scope < Scope
    def resolve
      if user.platform_admin? || user.studio_admin?
        scope.all
      elsif user.instructor?
        scope.where(user: user)
      else
        scope.where(public: true) # or scope.none
      end
    end
  end
end
