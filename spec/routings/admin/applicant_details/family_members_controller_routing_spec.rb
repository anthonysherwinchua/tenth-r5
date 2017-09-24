require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::FamilyMembersController, type: :routing do

  it { expect(get: '/admin/applicants/1/family_members/new').to route_to('admin/applicant_details/family_members#new', applicant_id: '1') }
  it { expect(post: '/admin/applicants/1/family_members').to route_to('admin/applicant_details/family_members#create', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/family_members/2/edit').to route_to('admin/applicant_details/family_members#edit', applicant_id: '1', id: '2') }
  it { expect(put: '/admin/applicants/1/family_members/2').to route_to('admin/applicant_details/family_members#update', applicant_id: '1', id: '2') }
  it { expect(patch: '/admin/applicants/1/family_members/2').to route_to('admin/applicant_details/family_members#update', applicant_id: '1', id: '2') }

end
