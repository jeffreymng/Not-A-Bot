class TweetsController < ApplicationController
  def create
    image = Image.new
    image.google_image_search
    image.get_clarifai_access_token
    image.clarifai_call
    tweets = get_tweets(sessions[:user])
    post = generate_tweet(tweets)
    new_post = post.concat(" ##{image.clarifai_tags.sample}")
    @user.twitter.update_with_media(new_post, open(image.image_url))
  end
end
