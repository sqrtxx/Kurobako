require 'spec_helper'
include SessionsHelper

describe SessionsController do
  let(:person) { create :person }
  describe '#new' do
    subject { get :new }
    it { expect(subject.status).to eq 200 }
    it { expect(subject).to render_template 'sessions/new' }
  end
  describe '#create' do
    before(:each) { person }
    subject { post :create, session: { email: person.email, password: 'password' } }
    it { expect(subject).to redirect_to root_url }
  end
  describe '#destroy' do
    before(:each) { person; sign_in person }
    subject { delete :destroy, {}, {} }
    # it { subject; expect(signed_in?).to be_false }
    it { expect(subject).to redirect_to root_url }
  end
end
