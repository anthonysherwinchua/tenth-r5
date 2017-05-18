require 'rails_helper'

RSpec.describe RequirementForm, type: :form do

  let(:job_opening) { create(:job_opening) }
  let(:requirement) { create(:requirement, job_opening: job_opening) }

  subject { described_class.new(job_opening, requirement) }

  it { expect(subject.job_opening).to eq(job_opening) }
  it { expect(subject.requirement).to eq(requirement) }

  describe '#save' do

    context 'valid' do

      let(:params) { attributes_for(:requirement) }

      it { expect(subject.save(params)).to eq(true) }

    end

    context 'invalid' do

      let(:params) { attributes_for(:requirement, :invalid) }

      it { expect(subject.save(params)).to eq(false) }

    end

  end

  describe '#documents' do

    let!(:documents) { create_list(:document, 3) }
    let!(:disabled_documents) { create_list(:document, 2, :disabled) }

    let(:requirement) { create(:requirement, job_opening: job_opening, document: documents.first) }

    it { expect(subject.documents).to eq(documents) }

  end

end
