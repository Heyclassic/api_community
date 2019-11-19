class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def update?
    user.admin? || same_user?
  end

  def destroy?
    user.admin? || same_user
  end

  def same_user?
    record.id == user.id
  end
end
