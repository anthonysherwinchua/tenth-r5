require 'rails_helper'

RSpec.describe Admin::Lookups::AcademicDegreesController, type: :routing do

  it { expect(get: '/admin/lookups/academic_degrees').to route_to('admin/lookups/academic_degrees#index') }

  it { expect(get: '/admin/lookups/academic_degrees/new').to route_to('admin/lookups/academic_degrees#new') }
  it { expect(post: '/admin/lookups/academic_degrees').to route_to('admin/lookups/academic_degrees#create') }

  it { expect(get: '/admin/lookups/academic_degrees/1/edit').to route_to('admin/lookups/academic_degrees#edit', id: '1') }
  it { expect(put: '/admin/lookups/academic_degrees/1').to route_to('admin/lookups/academic_degrees#update', id: '1') }
  it { expect(patch: '/admin/lookups/academic_degrees/1').to route_to('admin/lookups/academic_degrees#update', id: '1') }

end
