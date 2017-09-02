require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::ApplicantRequirementsController, type: :routing do

  it { expect(get: '/admin/applicants/1/applicant_requirements/new').to route_to('admin/applicant_details/applicant_requirements#new', applicant_id: '1') }
  it { expect(post: '/admin/applicants/1/applicant_requirements').to route_to('admin/applicant_details/applicant_requirements#create', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/applicant_requirements/2/edit').to route_to('admin/applicant_details/applicant_requirements#edit', applicant_id: '1', id: '2') }
  it { expect(put: '/admin/applicants/1/applicant_requirements/2').to route_to('admin/applicant_details/applicant_requirements#update', applicant_id: '1', id: '2') }
  it { expect(patch: '/admin/applicants/1/applicant_requirements/2').to route_to('admin/applicant_details/applicant_requirements#update', applicant_id: '1', id: '2') }

end
