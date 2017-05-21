require 'rails_helper'

RSpec.describe Admin::Lookups::CitizenshipsController, type: :routing do

  it { expect(get: '/admin/lookups/citizenships').to route_to('admin/lookups/citizenships#index') }

  it { expect(get: '/admin/lookups/citizenships/new').to route_to('admin/lookups/citizenships#new') }
  it { expect(post: '/admin/lookups/citizenships').to route_to('admin/lookups/citizenships#create') }

  it { expect(get: '/admin/lookups/citizenships/1/edit').to route_to('admin/lookups/citizenships#edit', id: '1') }
  it { expect(put: '/admin/lookups/citizenships/1').to route_to('admin/lookups/citizenships#update', id: '1') }
  it { expect(patch: '/admin/lookups/citizenships/1').to route_to('admin/lookups/citizenships#update', id: '1') }

end
