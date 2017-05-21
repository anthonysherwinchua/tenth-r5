require 'rails_helper'

RSpec.describe Admin::ApplicantsController, type: :controller do

  login_admin

  describe 'GET index' do

    subject { get :index }

    it { is_expected.to render_template :index }

  end

  describe 'GET new' do

    describe 'on new tab' do

      subject { get :new  }

      it { is_expected.to render_template :new }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :new, xhr: true }

      it { is_expected.to render_template :new }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'POST create' do

    context 'when valid' do

      let(:religion) { create(:religion) }
      let(:citizenship) { create(:citizenship) }
      let(:civil_status) { create(:civil_status) }

      subject { post :create, params: { applicant: attributes_for(:applicant).merge(religion_id: religion, citizenship_id: citizenship, civil_status_id: civil_status) } }

      it { expect { subject }.to change { Applicant.count }.by(1) }
      it { is_expected.to redirect_to admin_applicants_path }

    end

    context 'when invalid' do

      subject { post :create, params: { applicant: attributes_for(:applicant, :invalid) } }

      it { expect { subject }.not_to change { Applicant.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:applicant) { create(:applicant) }

    describe 'on new tab' do

      subject { get :edit, params: { id: applicant } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: applicant }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:applicant) { create(:applicant) }

    subject { put :update, params: { id: applicant.id, applicant: applicant_attributes } }

    context 'when valid' do

      let(:applicant_attributes) { attributes_for(:applicant, :as_params) }

      let!(:old_first_name) { applicant.first_name }
      let!(:new_first_name) { applicant_attributes[:first_name] }

      it { expect { subject }.to change { applicant.reload.first_name }.from(old_first_name).to(new_first_name) }
      it { is_expected.to redirect_to admin_applicants_path }

    end

    context 'when invalid' do

      let(:applicant_attributes) { attributes_for(:applicant, :invalid) }

      it { expect { subject }.not_to change { applicant.reload.first_name } }
      it { is_expected.to render_template :edit }

    end

  end

end
