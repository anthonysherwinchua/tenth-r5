require 'rails_helper'

RSpec.describe Admin::LookupsController, type: :routing do

  it { expect(get: '/admin/lookups').to route_to('admin/lookups#show') }

end
