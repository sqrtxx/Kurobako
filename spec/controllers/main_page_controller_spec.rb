require 'spec_helper'

describe MainPageController do

  describe "GET 'index'" do
    before(:each) { create_list(:person, 20) }
    subject { get :index }
    it { expect(subject.status).to eq 200 }
    it { subject; expect(assigns(:users).length).to eq 10 }
    it { expect(subject).to render_template 'main_page/index' }
  end

end
