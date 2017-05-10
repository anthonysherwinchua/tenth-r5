class User < ApplicationRecord

  devise :database_authenticatable, :recoverable, :trackable, :validatable, :lockable

  validates :password, presence: true, confirmation: { message: 'Please enter the same password.' }, if: :password_required?
  validates :role, presence: true

  enum role: [:admin, :manager, :cashier, :processing].freeze

  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end

end
