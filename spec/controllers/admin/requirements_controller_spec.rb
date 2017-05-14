require 'rails_helper'

RSpec.describe Admin::RequirementsController, type: :controller do

  login_admin

  let(:job_opening) { create(:job_opening) }

  describe 'GET new' do

    describe 'on new tab' do

      subject { get :new, params: { job_opening_id: job_opening } }

      it { is_expected.to render_template :new }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :new, params: { job_opening_id: job_opening }, xhr: true }

      it { is_expected.to render_template :new }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'POST create' do

    context 'when valid' do

      let(:document) { create(:document) }

      subject { post :create, params: { job_opening_id: job_opening, requirement: attributes_for(:requirement).merge(document_id: document) } }

      it { expect { subject }.to change { job_opening.requirements.count }.by(1) }
      it { is_expected.to redirect_to admin_job_opening_path(job_opening) }

    end

    context 'when invalid' do

      subject { post :create, params: { job_opening_id: job_opening, requirement: attributes_for(:requirement, :invalid) } }

      it { expect { subject }.not_to change { job_opening.requirements.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:requirement) { create(:requirement, job_opening: job_opening) }

    describe 'on new tab' do

      subject { get :edit, params: { job_opening_id: job_opening, id: requirement } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { job_opening_id: job_opening, id: requirement}, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

end
