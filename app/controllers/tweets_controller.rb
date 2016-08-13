class TweetsController < ApplicationController
  def create
    reply_prob = [0, 0, 0, 1]
    if reply_prob.sample == 1
      recent = @user.twitter.user_timeline("#{session[:user]}", count: 5).sample.id
      replies = ["Hey you sound a lot like a robot to me.", "I think a bot took over my twitter account, that's not me!", "The real me would never say stuff like that.", "Why can't I log on to my twitter? Oh. That's why."]
      @user.twitter.update("@#{session[:user]} #{replies.sample}", in_reply_to_status_id: recent)
    else
      image = Image.new
      image.google_image_search
      image.get_clarifai_access_token
      image.clarifai_call
      tweets = get_tweets(session[:user])
      post = generate_tweet(tweets)
      new_post = post.concat(" ##{image.clarifai_tags.sample}")
      @user.twitter.update_with_media(new_post, open(image.image_url))
    end
    @tweets = @user.twitter.user_timeline("#{session[:user]}", count: 10).sample.id
    redirect_to users_path
  end
end
