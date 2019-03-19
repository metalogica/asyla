class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end
  end

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user   = user
    @record = record
  end

  def index?
    @user.admin
  end

  def create?
    @user.admin
  end

  def show?
    @user.admin
  end

  def update?
    @user.admin
  end

  def destroy?
    @user.admin?
  end
end
