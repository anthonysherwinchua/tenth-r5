class CivilStatus < ApplicationRecord

  has_many :applicants, inverse_of: :civil_status

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(enabled: true) }

end
