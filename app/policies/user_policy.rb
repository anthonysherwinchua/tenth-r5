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

  def lock?
    update?
  end

  def unlock?
    update?
  end

  def role?
    update?
  end

end
