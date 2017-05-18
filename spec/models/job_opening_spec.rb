require 'rails_helper'

RSpec.describe JobOpening, type: :model do

  it { is_expected.to belong_to(:country).inverse_of(:job_openings) }
  it { is_expected.to belong_to(:occupation).inverse_of(:job_openings) }
  it { is_expected.to have_many(:requirements).inverse_of(:job_opening) }

  it { is_expected.to validate_presence_of(:country) }
  it { is_expected.to validate_presence_of(:occupation) }
  it { is_expected.to validate_uniqueness_of(:occupation_id).scoped_to(:country_id) }

end
