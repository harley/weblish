require 'spec_helper'

describe User do
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

  before do
    @user = FactoryGirl.create(:user)
  end

  describe "following" do
    subject { @user }
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save!
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user) }
    end
  end
end
