require 'rails_helper'

RSpec.describe ApplicantFamilyMember, type: :model do

  it { is_expected.to belong_to(:applicant).inverse_of(:family_members) }
  it { is_expected.to belong_to(:relationship).inverse_of(:family_members) }

  it { is_expected.to validate_presence_of(:applicant) }
  it { is_expected.to validate_presence_of(:relationship) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_presence_of(:occupation) }
  it { is_expected.to validate_presence_of(:salary) }

end
