class Occupation < ApplicationRecord

  has_many :job_openings, inverse_of: :occupation

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(enabled: true) }

end
