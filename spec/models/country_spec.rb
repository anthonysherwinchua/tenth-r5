require 'rails_helper'

RSpec.describe Country, type: :model do

  it { is_expected.to have_many(:job_openings).inverse_of(:country) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

end
