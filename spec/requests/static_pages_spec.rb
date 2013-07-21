require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        post_via_redirect user_session_path, user: {email: user.email, password: user.password}
        visit root_path
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          login_as(user, scope: :user)
          visit user_path(user)
        end
        let(:subject) { page }

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end
end
