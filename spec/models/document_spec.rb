require 'rails_helper'

RSpec.describe Document, type: :model do

  it { is_expected.to have_many(:requirements).inverse_of(:document) }
  it { is_expected.to have_many(:applicant_requirements).inverse_of(:document) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

end
