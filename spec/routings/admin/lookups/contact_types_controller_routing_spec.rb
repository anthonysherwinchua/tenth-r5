require 'rails_helper'

RSpec.describe Admin::Lookups::ContactTypesController, type: :routing do

  it { expect(get: '/admin/lookups/contact_types').to route_to('admin/lookups/contact_types#index') }

  it { expect(get: '/admin/lookups/contact_types/new').to route_to('admin/lookups/contact_types#new') }
  it { expect(get: '/admin/lookups/contact_types/new').to route_to('admin/lookups/contact_types#new') }
  it { expect(post: '/admin/lookups/contact_types').to route_to('admin/lookups/contact_types#create') }

  it { expect(get: '/admin/lookups/contact_types/1/edit').to route_to('admin/lookups/contact_types#edit', id: '1') }
  it { expect(put: '/admin/lookups/contact_types/1').to route_to('admin/lookups/contact_types#update', id: '1') }
  it { expect(patch: '/admin/lookups/contact_types/1').to route_to('admin/lookups/contact_types#update', id: '1') }

end
