class Religion < ApplicationRecord

  has_many :applicants, inverse_of: :religion

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(enabled: true) }

end
