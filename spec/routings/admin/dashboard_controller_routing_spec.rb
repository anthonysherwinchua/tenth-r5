require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :routing do

  it { expect(get: '/admin').to route_to('admin/dashboard#show') }

end
