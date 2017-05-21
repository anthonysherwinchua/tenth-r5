require 'rails_helper'

RSpec.describe Admin::Lookups::AcademicLevelsController, type: :controller do

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

      subject { post :create, params: { academic_level: attributes_for(:academic_level) } }

      it { expect { subject }.to change { AcademicLevel.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_academic_levels_path }

    end

    context 'when invalid' do

      subject { post :create, params: { academic_level: attributes_for(:academic_level, :invalid) } }

      it { expect { subject }.not_to change { AcademicLevel.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:academic_level) { create(:academic_level) }

    describe 'on new tab' do

      subject { get :edit, params: { id: academic_level } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: academic_level }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:academic_level) { create(:academic_level) }

    context 'when valid' do

      subject { put :update, params: { id: academic_level, academic_level: attributes_for(:academic_level) } }

      it { is_expected.to redirect_to admin_lookups_academic_levels_path }

    end

    context 'when invalid' do

      subject { put :update, params: { id: academic_level, academic_level: attributes_for(:academic_level, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
