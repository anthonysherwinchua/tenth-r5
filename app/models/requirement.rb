class Requirement < ApplicationRecord

  belongs_to :job_opening, inverse_of: :requirements
  belongs_to :document, inverse_of: :requirements

  validates :job_opening, :document, presence: true
  validates :document_id, uniqueness: { scope: :job_opening_id }

  scope :enabled, ->  { where(enabled: true) }

end
