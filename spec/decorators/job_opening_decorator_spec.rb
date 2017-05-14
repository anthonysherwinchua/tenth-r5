require 'rails_helper'

RSpec.describe JobOpeningDecorator, type: :decorator do

  let(:country) { create(:country) }
  let(:occupation) { create(:occupation) }
  let(:job_opening) { create(:job_opening, country: country, occupation: occupation) }

  subject { described_class.new(job_opening) }

  describe '#country_was' do

    context 'when not changed' do

      it { expect(subject.country_was).to eq(country) }

    end

    context 'when changed' do

      let(:new_country) { create(:country) }

      before { job_opening.country = new_country }

      it { expect(subject.country).to eq(new_country) }
      it { expect(subject.country_was).to eq(country) }

    end

  end

  describe '#occupation_was' do

    context 'when not changed' do

      it { expect(subject.occupation_was).to eq(occupation) }

    end

    context 'when changed' do

      let(:new_occupation) { create(:occupation) }

      before { job_opening.occupation = new_occupation }

      it { expect(subject.occupation).to eq(new_occupation) }
      it { expect(subject.occupation_was).to eq(occupation) }

    end

  end

end
