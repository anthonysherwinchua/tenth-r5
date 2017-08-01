require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::FamilyDetailsController, type: :routing do

  it { expect(get: '/admin/applicants/1/family_details').to route_to('admin/applicant_details/family_details#index', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/family_details/new').to route_to('admin/applicant_details/family_details#new', applicant_id: '1') }
  it { expect(post: '/admin/applicants/1/family_details').to route_to('admin/applicant_details/family_details#create', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/family_details/2/edit').to route_to('admin/applicant_details/family_details#edit', applicant_id: '1', id: '2') }
  it { expect(put: '/admin/applicants/1/family_details/2').to route_to('admin/applicant_details/family_details#update', applicant_id: '1', id: '2') }
  it { expect(patch: '/admin/applicants/1/family_details/2').to route_to('admin/applicant_details/family_details#update', applicant_id: '1', id: '2') }

end
