class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    belongs_to_user? || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    belongs_to_user? || user.admin?
  end

  def belongs_to_user?
    record.user_id == user.id
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
        scope.all
    end
  end
end
