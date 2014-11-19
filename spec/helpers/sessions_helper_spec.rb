require 'spec_helper'
include SessionsHelper

describe SessionsHelper do

  let(:person) { create :person }

  describe '#sign_in' do
    before(:each) { sign_in person }
    subject { signed_in? }
    it { expect(subject).to be_true }
  end
  describe '#signed_in?' do
    subject { signed_in? }
    it { expect(subject).to be_false }
  end
  describe '#sign_out' do
    before(:each) { sign_in person; sign_out }
    subject { signed_in? }
    it { expect(subject).to be_false }
  end
  describe '#current_user' do
    before(:each) { person; sign_in person }
    subject { current_user }
    it { expect(subject).to eq person }
  end
end
