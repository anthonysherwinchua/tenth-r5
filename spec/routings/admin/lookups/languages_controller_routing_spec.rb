require 'rails_helper'

RSpec.describe Admin::Lookups::LanguagesController, type: :routing do

  it { expect(get: '/admin/lookups/languages').to route_to('admin/lookups/languages#index') }

  it { expect(get: '/admin/lookups/languages/new').to route_to('admin/lookups/languages#new') }
  it { expect(get: '/admin/lookups/languages/new').to route_to('admin/lookups/languages#new') }
  it { expect(post: '/admin/lookups/languages').to route_to('admin/lookups/languages#create') }

  it { expect(get: '/admin/lookups/languages/1/edit').to route_to('admin/lookups/languages#edit', id: '1') }
  it { expect(put: '/admin/lookups/languages/1').to route_to('admin/lookups/languages#update', id: '1') }
  it { expect(patch: '/admin/lookups/languages/1').to route_to('admin/lookups/languages#update', id: '1') }

end
