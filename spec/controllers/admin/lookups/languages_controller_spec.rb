require 'rails_helper'

RSpec.describe Admin::Lookups::LanguagesController, type: :controller do

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

      subject { post :create, params: { language: attributes_for(:language) } }

      it { expect { subject }.to change { Language.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_languages_path }

    end

    context 'when invalid' do

      subject { post :create, params: { language: attributes_for(:language, :invalid) } }

      it { expect { subject }.not_to change { Language.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:language) { create(:language) }

    describe 'on new tab' do

      subject { get :edit, params: { id: language } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: language }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

end
