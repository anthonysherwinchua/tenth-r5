require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::FamilyDetailsController, type: :controller do

  login_admin

  let(:applicant) { create(:applicant) }

  describe 'GET index' do

    subject { get :index, params: { applicant_id: applicant.id } }

    it { is_expected.to render_template :index }

  end

  describe 'GET new' do

    describe 'on new tab' do

      subject { get :new, params: { applicant_id: applicant.id } }

      it { is_expected.to render_template :new }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :new, xhr: true, params: { applicant_id: applicant.id } }

      it { is_expected.to render_template :new }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'POST create' do

    context 'when valid' do

      subject { post :create, params: { applicant_id: applicant.id,
                                        applicant_family_detail: attributes_for(:applicant_family_detail) } }

      it { expect { subject }.to change { ApplicantFamilyDetail.count }.by(1) }
      it { is_expected.to redirect_to admin_applicant_path(applicant.id) }

    end

    context 'when invalid' do

      subject { post :create, params: { applicant_id: applicant.id,
                                        applicant_family_detail: attributes_for(:applicant_family_detail, :invalid) } }

      it { expect { subject }.not_to change { ApplicantFamilyDetail.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:applicant_family_detail) { create(:applicant_family_detail, applicant: applicant) }

    describe 'on new tab' do

      subject { get :edit, params: { applicant_id: applicant.id, id: applicant_family_detail.id } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { applicant_id: applicant.id, id: applicant_family_detail.id }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:applicant_family_detail) { create(:applicant_family_detail, applicant: applicant) }

    context 'when valid' do

      subject { put :update, params: { applicant_id: applicant.id, id: applicant_family_detail.id,
                                       applicant_family_detail: attributes_for(:applicant_family_detail) } }

      it { is_expected.to redirect_to admin_applicant_path(applicant) }

    end

    context 'when invalid' do

      subject { put :update, params: { applicant_id: applicant.id, id: applicant_family_detail.id,
                                       applicant_family_detail: attributes_for(:applicant_family_detail, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
