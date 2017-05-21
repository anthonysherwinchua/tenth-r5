class Citizenship < ApplicationRecord

  has_many :applicants, inverse_of: :citizenship

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(enabled: true) }

end
