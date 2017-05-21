require 'rails_helper'

RSpec.describe Admin::Lookups::DocumentsController, type: :routing do

  it { expect(get: '/admin/lookups/documents').to route_to('admin/lookups/documents#index') }

  it { expect(get: '/admin/lookups/documents/new').to route_to('admin/lookups/documents#new') }
  it { expect(post: '/admin/lookups/documents').to route_to('admin/lookups/documents#create') }

  it { expect(get: '/admin/lookups/documents/1/edit').to route_to('admin/lookups/documents#edit', id: '1') }
  it { expect(put: '/admin/lookups/documents/1').to route_to('admin/lookups/documents#update', id: '1') }
  it { expect(patch: '/admin/lookups/documents/1').to route_to('admin/lookups/documents#update', id: '1') }

end
