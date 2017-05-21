require 'rails_helper'

RSpec.describe Admin::Lookups::SchoolsController, type: :routing do

  it { expect(get: '/admin/lookups/schools').to route_to('admin/lookups/schools#index') }

  it { expect(get: '/admin/lookups/schools/new').to route_to('admin/lookups/schools#new') }
  it { expect(post: '/admin/lookups/schools').to route_to('admin/lookups/schools#create') }

  it { expect(get: '/admin/lookups/schools/1/edit').to route_to('admin/lookups/schools#edit', id: '1') }
  it { expect(put: '/admin/lookups/schools/1').to route_to('admin/lookups/schools#update', id: '1') }
  it { expect(patch: '/admin/lookups/schools/1').to route_to('admin/lookups/schools#update', id: '1') }

end
