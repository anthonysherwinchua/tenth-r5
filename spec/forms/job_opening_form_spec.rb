require 'rails_helper'

RSpec.describe JobOpeningForm, type: :form do

  let(:job_opening) { create(:job_opening) }

  subject { described_class.new(job_opening) }

  it { expect(subject.job_opening).to eq(job_opening) }

  describe '#save' do

    context 'valid' do

      let(:params) { attributes_for(:job_opening) }

      it { expect(subject.save(params)).to eq(true) }

    end

    context 'invalid' do

      let(:params) { attributes_for(:job_opening, :invalid) }

      it { expect(subject.save(params)).to eq(false) }

    end

  end

  describe '#countries' do

    let!(:countries) { create_list(:country, 3) }
    let!(:disabled_countries) { create_list(:country, 2, :disabled) }

    let(:job_opening) { create(:job_opening, country: countries.first) }

    it { expect(subject.countries).to eq(countries) }

  end

  describe '#occupations' do

    let!(:occupations) { create_list(:occupation, 3) }
    let!(:disabled_occupations) { create_list(:occupation, 2, :disabled) }

    let(:job_opening) { create(:job_opening, occupation: occupations.first) }

    it { expect(subject.occupations).to eq(occupations) }

  end

end
