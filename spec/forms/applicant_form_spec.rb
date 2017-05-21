require 'rails_helper'

RSpec.describe ApplicantForm, type: :form do

  let(:applicant) { create(:applicant) }

  subject { described_class.new(applicant) }

  it { expect(subject.applicant).to eq(applicant) }

  describe '#save' do

    context 'valid' do

      let(:params) { attributes_for(:applicant) }

      it { expect(subject.save(params)).to eq(true) }

    end

    context 'invalid' do

      let(:params) { attributes_for(:applicant, :invalid) }

      it { expect(subject.save(params)).to eq(false) }

    end

  end

  describe '#genders' do

    it { expect(subject.genders).to contain_exactly(*Applicant.genders.keys) }

  end

  describe '#religions' do

    let!(:religions) { create_list(:religion, 3) }
    let!(:disabled_religions) { create_list(:religion, 2, :disabled) }

    let(:applicant) { create(:applicant, religion: religions.first) }

    it { expect(subject.religions).to eq(religions) }

  end

  describe '#citizenships' do

    let!(:citizenships) { create_list(:citizenship, 3) }
    let!(:disabled_citizenships) { create_list(:citizenship, 2, :disabled) }

    let(:applicant) { create(:applicant, citizenship: citizenships.first) }

    it { expect(subject.citizenships).to eq(citizenships) }

  end

  describe '#civil_statuses' do

    let!(:civil_statuses) { create_list(:civil_status, 3) }
    let!(:disabled_civil_statuses) { create_list(:civil_status, 2, :disabled) }

    let(:applicant) { create(:applicant, civil_status: civil_statuses.first) }

    it { expect(subject.civil_statuses).to eq(civil_statuses) }

  end

end
