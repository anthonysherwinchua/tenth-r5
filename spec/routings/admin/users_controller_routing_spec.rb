require 'rails_helper'

RSpec.describe Admin::UsersController, type: :routing do

  it { expect(get: '/admin/users').to route_to('admin/users#index') }

  it { expect(get: '/admin/users/new').to route_to('admin/users#new') }
  it { expect(get: '/admin/users/new').to route_to('admin/users#new') }
  it { expect(post: '/admin/users').to route_to('admin/users#create') }

  it { expect(get: '/admin/users/1/edit').to route_to('admin/users#edit', id: '1') }
  it { expect(put: '/admin/users/1').to route_to('admin/users#update', id: '1') }
  it { expect(patch: '/admin/users/1').to route_to('admin/users#update', id: '1') }

  it { expect(get: '/admin/users/1/lock').to route_to('admin/users#lock', id: '1') }
  it { expect(patch: '/admin/users/1/lock').to route_to('admin/users#lock', id: '1') }
  it { expect(get: '/admin/users/1/unlock').to route_to('admin/users#unlock', id: '1') }
  it { expect(patch: '/admin/users/1/unlock').to route_to('admin/users#unlock', id: '1') }
  # it { expect(get: '/admin/users/1/role').to route_to('admin/users#role', id: '1') }
  # it { expect(patch: '/admin/users/1/role').to route_to('admin/users#role', id: '1') }

end
