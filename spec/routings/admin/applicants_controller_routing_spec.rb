require 'rails_helper'

RSpec.describe Admin::ApplicantsController, type: :routing do

  it { expect(get: '/admin/applicants').to route_to('admin/applicants#index') }
  it { expect(get: '/admin/applicants/1').to route_to('admin/applicants#show', id: '1') }

  it { expect(get: '/admin/applicants/new').to route_to('admin/applicants#new') }
  it { expect(get: '/admin/applicants/new').to route_to('admin/applicants#new') }
  it { expect(post: '/admin/applicants').to route_to('admin/applicants#create') }

  it { expect(get: '/admin/applicants/1/edit').to route_to('admin/applicants#edit', id: '1') }
  it { expect(put: '/admin/applicants/1').to route_to('admin/applicants#update', id: '1') }
  it { expect(patch: '/admin/applicants/1').to route_to('admin/applicants#update', id: '1') }

end
