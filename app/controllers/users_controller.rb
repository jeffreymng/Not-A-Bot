class UsersController < ApplicationController
  def index
    @user = current_user
    @tweets = @user.twitter.user_timeline("#{session[:user]}", count: 10)
    render :index
  end
end
