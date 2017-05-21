class UpdateUserRoleForm < BaseForm

  attr_accessor :user, :role

  validates :role, inclusion: { in: User.roles.keys, message: 'is invalid' }

  delegate :errors, to: :user

  def initialize(user)
    @user = user
  end

  def roles
    @roles ||= User.roles.keys
  end

  def save(role)
    @role = role
    return false unless valid?
    @user.public_send("#{@role}!")
  end

end
