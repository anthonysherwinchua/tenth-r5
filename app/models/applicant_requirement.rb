class ApplicantRequirement < ApplicationRecord

  belongs_to :applicant, inverse_of: :applicant_requirements
  belongs_to :document, inverse_of: :applicant_requirements

  validates :applicant, :document, presence: true
  validates :document_id, uniqueness: { scope: :applicant_id }

end
