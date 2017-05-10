require 'rails_helper'

RSpec.describe Admin::Lookups::SkillsController, type: :controller do

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

      subject { post :create, params: { skill: attributes_for(:skill) } }

      it { expect { subject }.to change { Skill.count }.by(1) }
      it { is_expected.to redirect_to admin_lookups_skills_path }

    end

    context 'when invalid' do

      subject { post :create, params: { skill: attributes_for(:skill, :invalid) } }

      it { expect { subject }.not_to change { Skill.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:skill) { create(:skill) }

    describe 'on new tab' do

      subject { get :edit, params: { id: skill } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: skill }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

end
