class JobOpening < ApplicationRecord

  belongs_to :country, inverse_of: :job_openings
  belongs_to :occupation, inverse_of: :job_openings

  validates :country, :occupation, presence: true
  validates :occupation_id, uniqueness: { scope: :country_id }

end
