require 'rails_helper'

RSpec.describe Admin::Lookups::CivilStatusesController, type: :controller do

  login_admin

  describe 'GET index' do

    subject { get :index }

    it { is_expected.to render_template :index }

  end

  describe 'GET new' do

    describe 'on new tab' do

      subject { get :new }

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

      subject { post :create, params: { civil_status: attributes_for(:civil_status) } }

      it { expect { subject }.to change { CivilStatus.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_civil_statuses_path }

    end

    context 'when invalid' do

      subject { post :create, params: { civil_status: attributes_for(:civil_status, :invalid) } }

      it { expect { subject }.not_to change { CivilStatus.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:civil_status) { create(:civil_status) }

    describe 'on new tab' do

      subject { get :edit, params: { id: civil_status } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: civil_status }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:civil_status) { create(:civil_status) }

    context 'when valid' do

      subject { put :update, params: { id: civil_status, civil_status: attributes_for(:civil_status) } }

      it { is_expected.to redirect_to admin_lookups_civil_statuses_path }

    end

    context 'when invalid' do

      subject { put :update, params: { id: civil_status, civil_status: attributes_for(:civil_status, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
