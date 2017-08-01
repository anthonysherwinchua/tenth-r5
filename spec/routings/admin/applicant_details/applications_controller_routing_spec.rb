require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::ApplicationsController, type: :routing do

  it { expect(get: '/admin/applicants/1/applications').to route_to('admin/applicant_details/applications#index', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/applications/new').to route_to('admin/applicant_details/applications#new', applicant_id: '1') }
  it { expect(post: '/admin/applicants/1/applications').to route_to('admin/applicant_details/applications#create', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/applications/2/edit').to route_to('admin/applicant_details/applications#edit', applicant_id: '1', id: '2') }
  it { expect(put: '/admin/applicants/1/applications/2').to route_to('admin/applicant_details/applications#update', applicant_id: '1', id: '2') }
  it { expect(patch: '/admin/applicants/1/applications/2').to route_to('admin/applicant_details/applications#update', applicant_id: '1', id: '2') }

end
