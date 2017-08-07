require 'rails_helper'

RSpec.describe ApplicantRequirement, type: :model do

  it { is_expected.to belong_to(:applicant).inverse_of(:applicant_requirements) }
  it { is_expected.to belong_to(:document).inverse_of(:applicant_requirements) }

  it { is_expected.to validate_presence_of(:applicant) }
  it { is_expected.to validate_presence_of(:document) }

  it { is_expected.to validate_uniqueness_of(:document_id).scoped_to(:applicant_id) }

end
