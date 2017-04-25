class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :manager, :cashier, :processing].freeze

end
