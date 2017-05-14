require 'rails_helper'

RSpec.describe Admin::RequirementsController, type: :routing do

  it { expect(get: '/admin/job_openings/1/requirements/new').to route_to('admin/requirements#new', job_opening_id: '1') }
  it { expect(post: '/admin/job_openings/1/requirements/').to route_to('admin/requirements#create', job_opening_id: '1') }

  it { expect(get: '/admin/job_openings/1/requirements/2/edit').to route_to('admin/requirements#edit', job_opening_id: '1', id: '2') }
  it { expect(put: '/admin/job_openings/1/requirements/2').to route_to('admin/requirements#update', job_opening_id: '1', id: '2') }
  it { expect(patch: '/admin/job_openings/1/requirements/2').to route_to('admin/requirements#update', job_opening_id: '1', id: '2') }

end
