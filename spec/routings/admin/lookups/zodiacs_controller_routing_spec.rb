require 'rails_helper'

RSpec.describe Admin::Lookups::ZodiacsController, type: :routing do

  it { expect(get: '/admin/lookups/zodiacs').to route_to('admin/lookups/zodiacs#index') }

  it { expect(get: '/admin/lookups/zodiacs/new').to route_to('admin/lookups/zodiacs#new') }
  it { expect(get: '/admin/lookups/zodiacs/new').to route_to('admin/lookups/zodiacs#new') }
  it { expect(post: '/admin/lookups/zodiacs').to route_to('admin/lookups/zodiacs#create') }

  it { expect(get: '/admin/lookups/zodiacs/1/edit').to route_to('admin/lookups/zodiacs#edit', id: '1') }
  it { expect(put: '/admin/lookups/zodiacs/1').to route_to('admin/lookups/zodiacs#update', id: '1') }
  it { expect(patch: '/admin/lookups/zodiacs/1').to route_to('admin/lookups/zodiacs#update', id: '1') }

end
