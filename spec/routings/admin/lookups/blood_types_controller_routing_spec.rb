require 'rails_helper'

RSpec.describe Admin::Lookups::BloodTypesController, type: :routing do

  it { expect(get: '/admin/lookups/blood_types').to route_to('admin/lookups/blood_types#index') }

  it { expect(get: '/admin/lookups/blood_types/new').to route_to('admin/lookups/blood_types#new') }
  it { expect(post: '/admin/lookups/blood_types').to route_to('admin/lookups/blood_types#create') }

  it { expect(get: '/admin/lookups/blood_types/1/edit').to route_to('admin/lookups/blood_types#edit', id: '1') }
  it { expect(put: '/admin/lookups/blood_types/1').to route_to('admin/lookups/blood_types#update', id: '1') }
  it { expect(patch: '/admin/lookups/blood_types/1').to route_to('admin/lookups/blood_types#update', id: '1') }

end
