class Country < ApplicationRecord

  has_many :job_openings, inverse_of: :country

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(enabled: true) }

end
