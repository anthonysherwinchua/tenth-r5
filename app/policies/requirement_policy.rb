class RequirementPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    @user.admin?
  end

  def update?
    create?
  end

end
