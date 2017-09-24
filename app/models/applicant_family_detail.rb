class ApplicantFamilyDetail < ApplicationRecord

  belongs_to :applicant, inverse_of: :family_detail

  validates :sisters, :brothers, :no_in_fam, :eldest, :youngest, :children, presence: true
  validates :sisters, :brothers, :no_in_fam, :eldest, :youngest, :children, numericality: { only_integer: true, greater_than: -1 }

end
