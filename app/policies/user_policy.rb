class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    @user.admin?
  end

  def update?
    create?
  end

  def activate?
    update?
  end

  def deactivate?
    update?
  end

  def role?
    update?
  end

end
