class Relationship < ApplicationRecord

  has_many :family_members, class_name: 'ApplicantFamilyMember', inverse_of: :relationship

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
