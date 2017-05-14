require 'rails_helper'

RSpec.describe RequirementDecorator, type: :decorator do

  let(:document) { create(:document) }
  let(:requirement) { create(:requirement, document: document) }

  subject { described_class.new(requirement) }

  describe '#document_was' do

    context 'when not changed' do

      it { expect(subject.document_was).to eq(document) }

    end

    context 'when changed' do

      let(:new_document) { create(:document) }

      before { requirement.document = new_document }

      it { expect(subject.document).to eq(new_document) }
      it { expect(subject.document_was).to eq(document) }

    end

  end

end
