require 'rails_helper'

RSpec.describe Citizenship, type: :model do

  it { is_expected.to have_many(:applicants).inverse_of(:citizenship) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

end
