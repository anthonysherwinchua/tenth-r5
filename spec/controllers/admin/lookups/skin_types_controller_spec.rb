require 'rails_helper'

RSpec.describe Admin::Lookups::SkinTypesController, type: :controller do

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

      subject { post :create, params: { skin_type: attributes_for(:skin_type) } }

      it { expect { subject }.to change { SkinType.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_skin_types_path }

    end

    context 'when invalid' do

      subject { post :create, params: { skin_type: attributes_for(:skin_type, :invalid) } }

      it { expect { subject }.not_to change { SkinType.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:skin_type) { create(:skin_type) }

    describe 'on new tab' do

      subject { get :edit, params: { id: skin_type } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: skin_type }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

end
