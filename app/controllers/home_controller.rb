class HomeController < ApplicationController
  def index
  end

  def dashboard
  end

  def personal
    if current_user
      redirect_to dashboard_url
    else
      store_location
      # redirect to sign in
      redirect_to new_user_session_path
      # mark return address to be this
    end
  end
end
