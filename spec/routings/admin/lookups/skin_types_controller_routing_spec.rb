require 'rails_helper'

RSpec.describe Admin::Lookups::SkinTypesController, type: :routing do

  it { expect(get: '/admin/lookups/skin_types').to route_to('admin/lookups/skin_types#index') }

  it { expect(get: '/admin/lookups/skin_types/new').to route_to('admin/lookups/skin_types#new') }
  it { expect(get: '/admin/lookups/skin_types/new').to route_to('admin/lookups/skin_types#new') }
  it { expect(post: '/admin/lookups/skin_types').to route_to('admin/lookups/skin_types#create') }

  it { expect(get: '/admin/lookups/skin_types/1/edit').to route_to('admin/lookups/skin_types#edit', id: '1') }
  it { expect(put: '/admin/lookups/skin_types/1').to route_to('admin/lookups/skin_types#update', id: '1') }
  it { expect(patch: '/admin/lookups/skin_types/1').to route_to('admin/lookups/skin_types#update', id: '1') }

end
