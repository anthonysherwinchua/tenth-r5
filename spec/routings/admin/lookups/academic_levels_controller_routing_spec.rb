require 'rails_helper'

RSpec.describe Admin::Lookups::AcademicLevelsController, type: :routing do

  it { expect(get: '/admin/lookups/academic_levels').to route_to('admin/lookups/academic_levels#index') }

  it { expect(get: '/admin/lookups/academic_levels/new').to route_to('admin/lookups/academic_levels#new') }
  it { expect(post: '/admin/lookups/academic_levels').to route_to('admin/lookups/academic_levels#create') }

  it { expect(get: '/admin/lookups/academic_levels/1/edit').to route_to('admin/lookups/academic_levels#edit', id: '1') }
  it { expect(put: '/admin/lookups/academic_levels/1').to route_to('admin/lookups/academic_levels#update', id: '1') }
  it { expect(patch: '/admin/lookups/academic_levels/1').to route_to('admin/lookups/academic_levels#update', id: '1') }

end
