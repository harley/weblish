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

      describe "in the Relationships controller" do
        describe "submitting to the create action" do
          before { post relationships_path }
          specify { expect(response).to redirect_to(new_user_session_path) }
        end

        describe "submitting to the destroy action" do
          before { delete relationship_path(1) }
          specify { expect(response).to redirect_to(new_user_session_path) }
        end
      end
    end
  end
end
