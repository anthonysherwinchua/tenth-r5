require 'rails_helper'

RSpec.describe Applicant, type: :model do

  it { is_expected.to belong_to(:religion).inverse_of(:applicants) }
  it { is_expected.to belong_to(:citizenship).inverse_of(:applicants) }
  it { is_expected.to belong_to(:civil_status).inverse_of(:applicants) }
  it { is_expected.to have_many(:applications).inverse_of(:applicant) }
  it { is_expected.to have_many(:applicant_requirements).inverse_of(:applicant) }
  it { is_expected.to have_one(:family_detail).class_name('ApplicantFamilyDetail').inverse_of(:applicant) }

  it { is_expected.to validate_presence_of(:religion) }
  it { is_expected.to validate_presence_of(:citizenship) }
  it { is_expected.to validate_presence_of(:civil_status) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:birthday) }
  it { is_expected.to validate_presence_of(:height) }
  it { is_expected.to validate_presence_of(:weight) }

  it { is_expected.to validate_uniqueness_of(:first_name).scoped_to(:last_name) }

  it { is_expected.to validate_numericality_of(:height).is_greater_than(0).only_integer }
  it { is_expected.to validate_numericality_of(:weight).is_greater_than(0).only_integer }

  describe 'birthdate validation' do

    context 'over 18 years old' do

      subject { build(:applicant, birthday: (18.years + 1.second).ago) }

      it { is_expected.to be_valid }

    end

    context 'under 18 years old' do

      subject { build(:applicant, birthday: (18.years - 1.day).ago) }

      it { is_expected.not_to be_valid }
    end

  end

  it { is_expected.to define_enum_for(:gender).with(male: 0, female: 1) }

end
