class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include MarkovHelper
  before_action :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def get_tweets(user)
    config = {
      :consumer_key    => "b6UX8hZRfxV2uLtkZNAVzh26b",
      :consumer_secret => "eenXF6hqi2A8My4cAd4UiAaPtMe16dLcLs1iYFYsPU5c7ThCmT",
    }
    client = Twitter::REST::Client.new(config)
    tweets = @user.twitter.user_timeline(user, count: 500)
    all_tweets = []
    tweets.each do |tweet|
      if !tweet.retweeted_tweet?
        all_tweets << tweet.full_text
      end
    end
    all_tweets.join(' ')
  end
end
