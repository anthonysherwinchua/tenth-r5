require 'rails_helper'

RSpec.describe Admin::Lookups::SkillsController, type: :routing do

  it { expect(get: '/admin/lookups/skills').to route_to('admin/lookups/skills#index') }

  it { expect(get: '/admin/lookups/skills/new').to route_to('admin/lookups/skills#new') }
  it { expect(get: '/admin/lookups/skills/new').to route_to('admin/lookups/skills#new') }
  it { expect(post: '/admin/lookups/skills').to route_to('admin/lookups/skills#create') }

  it { expect(get: '/admin/lookups/skills/1/edit').to route_to('admin/lookups/skills#edit', id: '1') }
  it { expect(put: '/admin/lookups/skills/1').to route_to('admin/lookups/skills#update', id: '1') }
  it { expect(patch: '/admin/lookups/skills/1').to route_to('admin/lookups/skills#update', id: '1') }

end
