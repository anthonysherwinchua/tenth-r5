require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:role) }

  it { is_expected.to define_enum_for(:role).with([:admin, :manager, :cashier, :processing]) }

end
