require 'rails_helper'

RSpec.describe Admin::Lookups::OccupationsController, type: :routing do

  it { expect(get: '/admin/lookups/occupations').to route_to('admin/lookups/occupations#index') }

  it { expect(get: '/admin/lookups/occupations/new').to route_to('admin/lookups/occupations#new') }
  it { expect(get: '/admin/lookups/occupations/new').to route_to('admin/lookups/occupations#new') }
  it { expect(post: '/admin/lookups/occupations').to route_to('admin/lookups/occupations#create') }

  it { expect(get: '/admin/lookups/occupations/1/edit').to route_to('admin/lookups/occupations#edit', id: '1') }
  it { expect(put: '/admin/lookups/occupations/1').to route_to('admin/lookups/occupations#update', id: '1') }
  it { expect(patch: '/admin/lookups/occupations/1').to route_to('admin/lookups/occupations#update', id: '1') }

end
