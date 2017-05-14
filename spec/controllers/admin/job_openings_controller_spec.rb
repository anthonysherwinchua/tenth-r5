require 'rails_helper'

RSpec.describe Admin::JobOpeningsController, type: :controller do

  login_admin

  describe 'GET index' do

    subject { get :index }

    it { is_expected.to render_template :index }

  end

  describe 'GET show' do

    let(:job_opening) { create(:job_opening) }

    subject { get :show, params: { id: job_opening } }

    it { is_expected.to render_template :show }

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

      let(:country) { create(:country) }
      let(:occupation) { create(:occupation) }

      subject { post :create, params: { job_opening: attributes_for(:job_opening).merge(country_id: country, occupation_id: occupation) } }

      it { expect { subject }.to change { JobOpening.count }.by(1) }
      it { is_expected.to redirect_to admin_job_openings_path }

    end

    context 'when invalid' do

      subject { post :create, params: { job_opening: attributes_for(:job_opening, :invalid) } }

      it { expect { subject }.not_to change { JobOpening.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:job_opening) { create(:job_opening) }

    describe 'on new tab' do

      subject { get :edit, params: { id: job_opening } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { id: job_opening }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:job_opening) { create(:job_opening) }

    context 'when valid' do

      let(:country) { create(:country) }
      let(:occupation) { create(:occupation) }

      subject { put :update, params: { id: job_opening, job_opening: attributes_for(:job_opening).merge(country_id: country, occupation_id: occupation) } }

      it { expect { subject }.to change { job_opening.reload.country_id }.to(country.id) }
      it { is_expected.to redirect_to admin_job_openings_path }

    end

    context 'when invalid' do

      subject { put :update, params: { id: job_opening, job_opening: attributes_for(:job_opening, :invalid) } }

      it { expect { subject }.not_to change { job_opening.country_id } }
      it { is_expected.to render_template :edit }

    end

  end

end
