class JobOpening < ApplicationRecord

  belongs_to :country, inverse_of: :job_openings
  belongs_to :occupation, inverse_of: :job_openings

  has_many :requirements, inverse_of: :job_opening
  has_many :applications, inverse_of: :job_opening

  validates :country, :occupation, presence: true
  validates :occupation_id, uniqueness: { scope: :country_id }

  scope :active, -> { where(enabled: true) }

end
