require 'spec_helper'

describe SessionsController do
  let(:person) { create :person }
  describe 'Sessions#new' do
    subject { get :new }
    it { expect(subject.status).to eq 200 }
    it { expect(subject).to render_template 'sessions/new' }
  end
  describe 'Sessions#create' do
    before(:each) { person }
    subject { post :create, session: { email: person.email, password: 'password' } }
    it { expect(subject).to redirect_to root_url }
  end
end
