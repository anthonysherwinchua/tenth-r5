require 'rails_helper'

RSpec.describe UpdateUserRoleForm, type: :form do

  let(:user) { create(:user, role: User.roles.keys.first) }

  subject { described_class.new(user) }

  it { expect(subject.user).to eq(user) }

  describe '#save' do

    context 'valid' do

      let(:params) { User.roles.keys.second }

      it { expect(subject.save(params)).to eq(true) }

    end

    context 'invalid' do

      let(:params) { 'hello' }

      it { expect(subject.save(params)).to eq(false) }

    end

  end

  describe '#roles' do

    it { expect(subject.roles).to eq(User.roles.keys) }

  end

end
