class Document < ApplicationRecord

  has_many :requirements, inverse_of: :document
  has_many :applicant_requirements, inverse_of: :document

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(enabled: true) }

end
