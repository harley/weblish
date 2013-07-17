class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'user'
    end
  end
end
