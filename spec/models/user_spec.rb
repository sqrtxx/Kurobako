require 'spec_helper'

describe User do

  let(:user) { create :person }

  describe 'validations' do
    it { expect(build(:person, screen_name: nil)).to have(3).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: ';;;')).to have(1).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: 'aA0_')).to have(0).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: 'Aaa')).to have(0).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: '_aa')).to have(1).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: '0aa')).to have(0).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: 'a' * 2)).to have(1).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: 'a' * 3)).to have(0).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: 'a' * 20)).to have(0).errors_on(:screen_name) }
    it { expect(build(:person, screen_name: 'a' * 21)).to have(1).errors_on(:screen_name) }
    it { expect(build(:person, email: nil)).to have(2).errors_on(:email) }
    it { expect(build(:person, email: 'hoge')).to have(1).errors_on(:email) }
    it { expect(build(:person, email: 'hoge@[]')).to have(1).errors_on(:email) }
    it { expect(build(:person, email: 'hoge@example.com')).to have(0).errors_on(:email) }
    it { expect(build(:person, full_name: 'a' * 255)).to have(0).errors_on(:full_name) }
    it { expect(build(:person, full_name: 'a' * 256)).to have(1).errors_on(:full_name) }
    it { expect(build(:person, description: 'a' * 255)).to have(0).errors_on(:description) }
    it { expect(build(:person, description: 'a' * 256)).to have(1).errors_on(:description) }
    it { expect(build(:person, url: 'abc')).to have(1).errors_on(:url) }
    it { expect(build(:person, url: 'http://hogehoge.com')).to have(0).errors_on(:url) }
  end

  describe '.recent' do
    let(:user_1_day_ago) { create :person, created_at: 1.day.ago }
    let(:user_2_days_ago) { create :person, created_at: 2.days.ago }
    before(:each) { user_1_day_ago; user_2_days_ago }
    it { expect(User.recent).to eq [user_1_day_ago, user_2_days_ago] }
  end

end
