class TweetsController < ApplicationController
  def create
    current_user
    reply_prob = [0, 0, 0, 1]
    if reply_prob.sample == 1
      recent = @current_user.twitter.user_timeline("JustJeffing", count: 5).sample.id
      replies = ["Hey you sound a lot like a robot to me.", "I think a bot took over my twitter account, that's not me!", "The real me would never say stuff like that.", "Why can't I log on to my twitter? Oh. That's why."]
      @current_user.twitter.update("@JustJeffing #{replies.sample}", in_reply_to_status_id: recent)
    else
      image = Image.new
      image.google_image_search
      image.get_clarifai_access_token
      image.clarifai_call
      tweets = get_tweets("JustJeffing")
      post = generate_tweet(tweets)
      new_post = post.concat(" ##{image.clarifai_tags.sample}")
      @current_user.twitter.update_with_media(new_post, open(image.image_url))
    end
    @tweets = @current_user.twitter.user_timeline("#{session[:user]}", count: 10).sample.id
    redirect_to users_path
  end
end
