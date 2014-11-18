require 'spec_helper'

describe SessionsController do
  let(:person) { create :person }
  describe 'Sessions#create' do
    before(:each) { person }
    subject { post :create, session: { email: person.email, password: 'password' } }
    it { expect(subject).to redirect_to user_path(person) }
  end
end
