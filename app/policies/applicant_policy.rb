class ApplicantPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    [:admin, :manager, :processing].include? @user.role.to_sym
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

end
