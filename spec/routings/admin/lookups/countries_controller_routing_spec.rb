require 'rails_helper'

RSpec.describe Admin::Lookups::CountriesController, type: :routing do

  it { expect(get: '/admin/lookups/countries').to route_to('admin/lookups/countries#index') }

  it { expect(get: '/admin/lookups/countries/new').to route_to('admin/lookups/countries#new') }
  it { expect(get: '/admin/lookups/countries/new').to route_to('admin/lookups/countries#new') }
  it { expect(post: '/admin/lookups/countries').to route_to('admin/lookups/countries#create') }

  it { expect(get: '/admin/lookups/countries/1/edit').to route_to('admin/lookups/countries#edit', id: '1') }
  it { expect(put: '/admin/lookups/countries/1').to route_to('admin/lookups/countries#update', id: '1') }
  it { expect(patch: '/admin/lookups/countries/1').to route_to('admin/lookups/countries#update', id: '1') }

end
