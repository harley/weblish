require 'spec_helper'

describe "Authentication" do
  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      subject { page }

      describe "in the Users controller" do
        describe "visiting the following page" do
          before { visit following_user_path(user) }
          it { should have_content('sign in') }
        end

        describe "visiting the followers page" do
          before { visit followers_user_path(user) }
          it { should have_content('sign in') }
        end
      end
    end
  end
end
