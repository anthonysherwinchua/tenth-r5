require 'rails_helper'

RSpec.describe ApplicantFamilyDetail, type: :model do

  it { is_expected.to belong_to(:applicant).inverse_of(:family_detail) }

  it { is_expected.to validate_presence_of(:sisters) }
  it { is_expected.to validate_presence_of(:brothers) }
  it { is_expected.to validate_presence_of(:no_in_fam) }
  it { is_expected.to validate_presence_of(:children) }
  it { is_expected.to validate_presence_of(:eldest) }
  it { is_expected.to validate_presence_of(:youngest) }

  it { is_expected.to validate_numericality_of(:sisters).is_greater_than(-1).only_integer }
  it { is_expected.to validate_numericality_of(:brothers).is_greater_than(-1).only_integer }
  it { is_expected.to validate_numericality_of(:no_in_fam).is_greater_than(-1).only_integer }
  it { is_expected.to validate_numericality_of(:children).is_greater_than(-1).only_integer }
  it { is_expected.to validate_numericality_of(:eldest).is_greater_than(-1).only_integer }
  it { is_expected.to validate_numericality_of(:youngest).is_greater_than(-1).only_integer }

end
