require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

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

      subject { post :create, params: { user: attributes_for(:user) } }

      it { expect { subject }.to change { User.count }.by(1) }
      it { is_expected.to redirect_to admin_users_path }

    end

    context 'when invalid' do

      subject { post :create, params: { user: attributes_for(:user, :invalid) } }

      it { expect { subject }.not_to change { User.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:user) { create(:user) }

    describe 'on new tab' do

      subject { get :edit, params: { id: user } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: user }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:user) { create(:user) }

    subject { put :update, params: { id: user.id, user: user_attributes } }

    context 'when valid' do

      let(:user_attributes) { attributes_for(:user, :as_params) }

      let!(:old_email) { user.email }
      let!(:new_email) { user_attributes[:email] }

      it { expect { subject }.to change { user.reload.email }.from(old_email).to(new_email) }
      it { is_expected.to redirect_to admin_users_path }

    end

    context 'when invalid' do

      let(:user_attributes) { attributes_for(:user, :invalid) }

      it { expect { subject }.not_to change { user.reload.email } }
      it { is_expected.to render_template :edit }

    end

  end

  describe 'GET lock' do

    let(:user) { create(:user) }

    describe 'on new tab' do

      subject { get :lock, params: { id: user } }

      it { is_expected.to render_template :lock }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :lock, params: { id: user }, xhr: true }

      it { is_expected.to render_template :lock }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PATCH lock' do

    subject { patch :lock, params: { id: user.id } }

    let(:user) { create(:user, :unlocked) }

    it { expect { subject }.to change { user.reload.access_locked? }.from(false).to(true) }
    it { is_expected.to redirect_to admin_users_path }

  end

  describe 'GET unlock' do

    let(:user) { create(:user) }

    describe 'on new tab' do

      subject { get :unlock, params: { id: user } }

      it { is_expected.to render_template :unlock }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :unlock, params: { id: user }, xhr: true }

      it { is_expected.to render_template :unlock }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PATCH unlock' do

    subject { patch :unlock, params: { id: user.id } }

    let(:user) { create(:user, :locked) }

    it { expect { subject }.to change { user.reload.access_locked? }.from(true).to(false) }
    it { is_expected.to redirect_to admin_users_path }

  end

  describe 'GET role' do

    let(:user) { create(:user) }

    describe 'on new tab' do

      subject { get :role, params: { id: user } }

      it { is_expected.to render_template :role }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :role, params: { id: user }, xhr: true }

      it { is_expected.to render_template :role }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PATCH role' do

    let(:old_role) { User.roles.keys.first }
    let(:user) { create(:user, role: old_role) }

    subject { patch :role, params: { id: user, user: { role: new_role } } }

    context 'when valid' do

      let(:new_role) { User.roles.keys.second }

      it { expect { subject }.to change { user.reload.role }.from(old_role).to(new_role) }
      it { is_expected.to redirect_to admin_users_path }

    end

    context 'when invalid' do

      let(:new_role) { 'hello' }

      it { expect { subject }.not_to change { user.reload.role } }
      it { is_expected.to render_template :role }

    end

  end

end
