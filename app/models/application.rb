class Application < ApplicationRecord

  belongs_to :applicant, inverse_of: :applications
  belongs_to :job_opening, inverse_of: :applications

  validates :applicant, :job_opening, presence: true
  validates :applicant_code, presence: true, uniqueness: { case_sensitive: false }
  validates :job_opening_id, uniqueness: { scope: :applicant_id }

end
