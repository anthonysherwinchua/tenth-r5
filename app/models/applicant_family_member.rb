class ApplicantFamilyMember < ApplicationRecord

  belongs_to :applicant, inverse_of: :family_members
  belongs_to :relationship, inverse_of: :family_members

  validates :applicant, :relationship, presence: true
  validates :occupation, :name, :age, :salary, presence: true

end
