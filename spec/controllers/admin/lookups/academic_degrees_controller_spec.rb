require 'rails_helper'

RSpec.describe Admin::Lookups::AcademicDegreesController, type: :controller do

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

      subject { post :create, params: { academic_degree: attributes_for(:academic_degree) } }

      it { expect { subject }.to change { AcademicDegree.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_academic_degrees_path }

    end

    context 'when invalid' do

      subject { post :create, params: { academic_degree: attributes_for(:academic_degree, :invalid) } }

      it { expect { subject }.not_to change { AcademicDegree.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:academic_degree) { create(:academic_degree) }

    describe 'on new tab' do

      subject { get :edit, params: { id: academic_degree } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: academic_degree }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:academic_degree) { create(:academic_degree) }

    context 'when valid' do

      subject { put :update, params: { id: academic_degree, academic_degree: attributes_for(:academic_degree) } }

      it { is_expected.to redirect_to admin_lookups_academic_degrees_path }

    end

    context 'when invalid' do

      subject { put :update, params: { id: academic_degree, academic_degree: attributes_for(:academic_degree, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
