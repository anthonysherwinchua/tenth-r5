require 'rails_helper'

RSpec.describe Admin::Lookups::ZodiacsController, type: :controller do

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

      subject { post :create, params: { zodiac: attributes_for(:zodiac) } }

      it { expect { subject }.to change { Zodiac.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_zodiacs_path }

    end

    context 'when invalid' do

      subject { post :create, params: { zodiac: attributes_for(:zodiac, :invalid) } }

      it { expect { subject }.not_to change { Zodiac.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:zodiac) { create(:zodiac) }

    describe 'on new tab' do

      subject { get :edit, params: { id: zodiac } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: zodiac }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:zodiac) { create(:zodiac) }

    context 'when valid' do

      subject { put :update, params: { id: zodiac, zodiac: attributes_for(:zodiac) } }

      it { is_expected.to redirect_to admin_lookups_zodiacs_path }

    end

    context 'when invalid' do

      subject { put :update, params: { id: zodiac, zodiac: attributes_for(:zodiac, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
