require 'rails_helper'

RSpec.describe Admin::Lookups::BloodTypesController, type: :controller do

  login_user

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

      subject { post :create, params: { blood_type: attributes_for(:blood_type) } }

      it { expect { subject }.to change { BloodType.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_blood_types_path }

    end

    context 'when invalid' do

      subject { post :create, params: { blood_type: attributes_for(:blood_type, :invalid) } }

      it { expect { subject }.not_to change { BloodType.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:blood_type) { create(:blood_type) }

    describe 'on new tab' do

      subject { get :edit, params: { id: blood_type } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: blood_type }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

end
