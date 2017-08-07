require 'rails_helper'

RSpec.describe Application, type: :model do

  it { is_expected.to belong_to(:applicant).inverse_of(:applications) }
  it { is_expected.to belong_to(:job_opening).inverse_of(:applications) }

  it { is_expected.to validate_presence_of(:applicant) }
  it { is_expected.to validate_presence_of(:job_opening) }
  it { is_expected.to validate_presence_of(:applicant_code) }

  it { is_expected.to validate_uniqueness_of(:applicant_code).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:job_opening_id).scoped_to(:applicant_id) }

end
