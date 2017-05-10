require 'rails_helper'

RSpec.describe Admin::Lookups::ReligionsController, type: :routing do

  it { expect(get: '/admin/lookups/religions').to route_to('admin/lookups/religions#index') }

  it { expect(get: '/admin/lookups/religions/new').to route_to('admin/lookups/religions#new') }
  it { expect(get: '/admin/lookups/religions/new').to route_to('admin/lookups/religions#new') }
  it { expect(post: '/admin/lookups/religions').to route_to('admin/lookups/religions#create') }

  it { expect(get: '/admin/lookups/religions/1/edit').to route_to('admin/lookups/religions#edit', id: '1') }
  it { expect(put: '/admin/lookups/religions/1').to route_to('admin/lookups/religions#update', id: '1') }
  it { expect(patch: '/admin/lookups/religions/1').to route_to('admin/lookups/religions#update', id: '1') }

end
