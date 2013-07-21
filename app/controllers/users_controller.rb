class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users#.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers#.page(params[:page])
    render 'show_follow'
  end
end
