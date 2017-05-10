class User < ApplicationRecord

  devise :database_authenticatable, :recoverable, :trackable, :validatable

  enum role: [:admin, :manager, :cashier, :processing].freeze

end
