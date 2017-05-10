require 'rails_helper'

RSpec.describe Admin::Lookups::DocumentsController, type: :controller do

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

      subject { post :create, params: { document: attributes_for(:document) } }

      it { expect { subject }.to change { Document.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_documents_path }

    end

    context 'when invalid' do

      subject { post :create, params: { document: attributes_for(:document, :invalid) } }

      it { expect { subject }.not_to change { Document.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:document) { create(:document) }

    describe 'on new tab' do

      subject { get :edit, params: { id: document } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: document }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

end
