require 'rails_helper'

RSpec.describe Admin::Lookups::CountriesController, type: :controller do

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

      subject { post :create, params: { country: attributes_for(:country) } }

      it { expect { subject }.to change { Country.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_countries_path }

    end

    context 'when invalid' do

      subject { post :create, params: { country: attributes_for(:country, :invalid) } }

      it { expect { subject }.not_to change { Country.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:country) { create(:country) }

    describe 'on new tab' do

      subject { get :edit, params: { id: country } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: country }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:country) { create(:country) }

    context 'when valid' do

      subject { put :update, params: { id: country, country: attributes_for(:country) } }

      it { is_expected.to redirect_to admin_lookups_countries_path }

    end

    context 'when invalid' do

      subject { put :update, params: { id: country, country: attributes_for(:country, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
