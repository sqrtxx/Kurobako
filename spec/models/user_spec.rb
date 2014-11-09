require 'spec_helper'

describe User do

  let(:user) { create :person }

  describe '.recent' do
    let(:user_1_day_ago) { create :person, created_at: 1.day.ago }
    let(:user_2_days_ago) { create :person, created_at: 2.days.ago }
    before(:each) { user_1_day_ago; user_2_days_ago }
    it { expect(User.recent).to eq [user_1_day_ago, user_2_days_ago] }
  end

end
