require 'rails_helper'

RSpec.describe Admin::Lookups::CivilStatusesController, type: :routing do

  it { expect(get: '/admin/lookups/civil_statuses').to route_to('admin/lookups/civil_statuses#index') }

  it { expect(get: '/admin/lookups/civil_statuses/new').to route_to('admin/lookups/civil_statuses#new') }
  it { expect(get: '/admin/lookups/civil_statuses/new').to route_to('admin/lookups/civil_statuses#new') }
  it { expect(post: '/admin/lookups/civil_statuses').to route_to('admin/lookups/civil_statuses#create') }

  it { expect(get: '/admin/lookups/civil_statuses/1/edit').to route_to('admin/lookups/civil_statuses#edit', id: '1') }
  it { expect(put: '/admin/lookups/civil_statuses/1').to route_to('admin/lookups/civil_statuses#update', id: '1') }
  it { expect(patch: '/admin/lookups/civil_statuses/1').to route_to('admin/lookups/civil_statuses#update', id: '1') }

end
