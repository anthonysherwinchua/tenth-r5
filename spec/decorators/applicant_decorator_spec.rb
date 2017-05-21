require 'rails_helper'

RSpec.describe ApplicantDecorator, type: :decorator do

  let(:applicant) { create(:applicant) }

  subject { described_class.new(applicant) }

  describe '#name' do

    it { expect(subject.name).to eq([applicant.first_name, subject.middle_initial, applicant.last_name, applicant.suffix_name].join(' ')) }

  end

  describe '#middle_initial' do

    context 'with no middle name' do

      let(:applicant) { create(:applicant, middle_name: nil) }

      it { expect(subject.middle_initial).to be_blank }

    end

    context 'with middle name' do

      let(:applicant) { create(:applicant, middle_name: 'bond') }

      it { expect(subject.middle_initial).to eq('b.') }

    end

  end

  describe '#gender' do

    context 'when male' do

      let(:applicant) { create(:applicant, gender: :male) }

      it { expect(subject.gender).to eq('Male') }

    end

    context 'when female' do

      let(:applicant) { create(:applicant, gender: :female) }

      it { expect(subject.gender).to eq('Female') }

    end

  end

  describe '#age' do

    let(:applicant) { create(:applicant, birthday: 18.years.ago) }

    it { expect(subject.age).to eq('18 y/o') }

  end

  describe '#height' do

    let(:applicant) { create(:applicant, height: 160) }

    it { expect(subject.height).to eq('160 cms') }

  end

  describe '#weight' do

    let(:applicant) { create(:applicant, weight: 50) }

    it { expect(subject.weight).to eq('50 kgs') }

  end

end
