require 'rails_helper'

RSpec.describe Admin::ApplicantDetails::FamilyMembersController, type: :controller do

  login_admin

  let(:applicant) { create(:applicant) }

  describe 'GET new' do

    describe 'on new tab' do

      subject { get :new, params: { applicant_id: applicant.id } }

      it { is_expected.to render_template :new }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :new, xhr: true, params: { applicant_id: applicant.id } }

      it { is_expected.to render_template :new }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'POST create' do

    context 'when valid' do

      let(:relationship) { create(:relationship) }
      let(:applicant_family_member_params) do
        attributes_for(:applicant_family_member).merge(relationship_id: relationship.id)
      end

      subject { post :create, params: { applicant_id: applicant.id,
                                        applicant_family_member: applicant_family_member_params } }

      it { expect { subject }.to change { ApplicantFamilyMember.count }.by(1) }
      it { is_expected.to redirect_to admin_applicant_path(applicant.id) }

    end

    context 'when invalid' do

      subject { post :create, params: { applicant_id: applicant.id,
                                        applicant_family_member: attributes_for(:applicant_family_member, :invalid) } }

      it { expect { subject }.not_to change { ApplicantFamilyMember.count } }
      it { is_expected.to render_template :new }

    end

  end

  describe 'GET edit' do

    let(:applicant_family_member) { create(:applicant_family_member, applicant: applicant) }

    describe 'on new tab' do

      subject { get :edit, params: { applicant_id: applicant.id, id: applicant_family_member.id } }

      it { is_expected.to render_template :edit }
      it { is_expected.to render_with_layout 'admin_lte_2' }

    end

    describe 'on modal' do

      subject { get :edit, params: { applicant_id: applicant.id, id: applicant_family_member.id }, xhr: true }

      it { is_expected.to render_template :edit }
      it { is_expected.not_to render_with_layout }

    end

  end

  describe 'PUT update' do

    let(:applicant_family_member) { create(:applicant_family_member, applicant: applicant) }

    context 'when valid' do

      subject { put :update, params: { applicant_id: applicant.id, id: applicant_family_member.id,
                                       applicant_family_member: attributes_for(:applicant_family_member) } }

      it { is_expected.to redirect_to admin_applicant_path(applicant) }

    end

    context 'when invalid' do

      subject { put :update, params: { applicant_id: applicant.id, id: applicant_family_member.id,
                                       applicant_family_member: attributes_for(:applicant_family_member, :invalid) } }

      it { is_expected.to render_template :edit }

    end

  end

end
