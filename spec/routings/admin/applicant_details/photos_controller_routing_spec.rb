require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::PhotosController, type: :routing do

  it { expect(get: '/admin/applicants/1/photos').to route_to('admin/applicant_details/photos#index', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/photos/new').to route_to('admin/applicant_details/photos#new', applicant_id: '1') }
  it { expect(post: '/admin/applicants/1/photos').to route_to('admin/applicant_details/photos#create', applicant_id: '1') }

  it { expect(get: '/admin/applicants/1/photos/2/edit').to route_to('admin/applicant_details/photos#edit', applicant_id: '1', id: '2') }
  it { expect(put: '/admin/applicants/1/photos/2').to route_to('admin/applicant_details/photos#update', applicant_id: '1', id: '2') }
  it { expect(patch: '/admin/applicants/1/photos/2').to route_to('admin/applicant_details/photos#update', applicant_id: '1', id: '2') }

end
