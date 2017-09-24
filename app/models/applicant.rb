class Applicant < ApplicationRecord

  belongs_to :religion, inverse_of: :applicants
  belongs_to :citizenship, inverse_of: :applicants
  belongs_to :civil_status, inverse_of: :applicants

  has_many :applications, inverse_of: :applicant
  has_many :applicant_requirements, inverse_of: :applicant

  has_one :family_detail, class_name: 'ApplicantFamilyDetail', inverse_of: :applicant

  validates :religion, :citizenship, :civil_status, presence: true
  validates :first_name, :last_name, :birthday, :height, :weight, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  validates :height, :weight, numericality: { only_integer: true, greater_than: 0 }

  validates :birthday, timeliness: { on_or_before: -> { 18.years.ago }, type: :date }

  enum gender: { male: 0, female: 1 }

end
