require 'rails_helper'

RSpec.describe Admin::JobOpeningsController, type: :routing do

  it { expect(get: '/admin/job_openings').to route_to('admin/job_openings#index') }
  it { expect(get: '/admin/job_openings/1').to route_to('admin/job_openings#show', id: '1') }

  it { expect(get: '/admin/job_openings/new').to route_to('admin/job_openings#new') }
  it { expect(get: '/admin/job_openings/new').to route_to('admin/job_openings#new') }
  it { expect(post: '/admin/job_openings').to route_to('admin/job_openings#create') }

  it { expect(get: '/admin/job_openings/1/edit').to route_to('admin/job_openings#edit', id: '1') }
  it { expect(put: '/admin/job_openings/1').to route_to('admin/job_openings#update', id: '1') }
  it { expect(patch: '/admin/job_openings/1').to route_to('admin/job_openings#update', id: '1') }

end
