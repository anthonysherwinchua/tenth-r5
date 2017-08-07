require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::ApplicationsController, type: :controller do

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

    let(:job_opening) { create(:job_opening) }

    context 'when valid' do

      let(:application_params) { attributes_for(:application).merge({ job_opening_id: job_opening.id}) }

      subject { post :create, params: { applicant_id: applicant.id, application: application_params } }

      it { expect { subject }.to change { Application.count }.by(1) }
      it { is_expected.to redirect_to admin_applicant_path(applicant.id) }

    end

    context 'when invalid' do

      subject { post :create, params: { applicant_id: applicant.id, application: attributes_for(:application, :invalid) } }

      it { expect { subject }.not_to change { Application.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:application) { create(:application, applicant: applicant) }

    describe 'on new tab' do

      subject { get :edit, params: { applicant_id: applicant.id, id: application.id } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { applicant_id: applicant.id, id: application.id }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:application) { create(:application, applicant: applicant) }

    context 'when valid' do

      subject { put :update, params: { applicant_id: applicant.id, id: application.id, application: attributes_for(:application) } }

      it { is_expected.to redirect_to admin_applicant_path(applicant) }

    end

    context 'when invalid' do

      subject { put :update, params: { applicant_id: applicant.id, id: application.id, application: attributes_for(:application, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
