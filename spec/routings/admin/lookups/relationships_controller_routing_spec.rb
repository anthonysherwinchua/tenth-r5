require 'rails_helper'

RSpec.describe Admin::Lookups::RelationshipsController, type: :routing do

  it { expect(get: '/admin/lookups/relationships').to route_to('admin/lookups/relationships#index') }

  it { expect(get: '/admin/lookups/relationships/new').to route_to('admin/lookups/relationships#new') }
  it { expect(get: '/admin/lookups/relationships/new').to route_to('admin/lookups/relationships#new') }
  it { expect(post: '/admin/lookups/relationships').to route_to('admin/lookups/relationships#create') }

  it { expect(get: '/admin/lookups/relationships/1/edit').to route_to('admin/lookups/relationships#edit', id: '1') }
  it { expect(put: '/admin/lookups/relationships/1').to route_to('admin/lookups/relationships#update', id: '1') }
  it { expect(patch: '/admin/lookups/relationships/1').to route_to('admin/lookups/relationships#update', id: '1') }

end
