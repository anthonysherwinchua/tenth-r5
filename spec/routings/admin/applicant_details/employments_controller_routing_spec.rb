require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::EmploymentsController, type: :routing do

  it { expect(get: '/admin/applicants/1/employments').to route_to('admin/applicant_details/employments#index', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/employments/new').to route_to('admin/applicant_details/employments#new', applicant_id: '1') }
  it { expect(post: '/admin/applicants/1/employments').to route_to('admin/applicant_details/employments#create', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/employments/2/edit').to route_to('admin/applicant_details/employments#edit', applicant_id: '1', id: '2') }
  it { expect(put: '/admin/applicants/1/employments/2').to route_to('admin/applicant_details/employments#update', applicant_id: '1', id: '2') }
  it { expect(patch: '/admin/applicants/1/employments/2').to route_to('admin/applicant_details/employments#update', applicant_id: '1', id: '2') }

end
