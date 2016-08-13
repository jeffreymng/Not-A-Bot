class Image
  attr_reader :tag1, :tag2, :tag3, :image_url, :clarifai_access_token, :clarifai_tags
  
  def initialize 
    @tag1 = IMAGE_TAGS.sample
    @tag2 = IMAGE_TAGS.sample
    @tag3 = IMAGE_TAGS.sample
  end
  
  def google_image_search
    uri = URI.parse("https://www.googleapis.com/customsearch/v1?q=#{tag1}+#{tag2}+#{tag3}&cx=012359143950802216498%3Arwlft0thadk&searchType=image&key=#{ENV['GOOGLE_CUSTOM_SEARCH_KEY']}")
    response = Net::HTTP.get_response(uri)
    query = JSON.parse(response.body)
    @image_url = query['items'][rand(10)]['link']
  end
  
  def get_clarifai_access_token
    response = `curl -X POST "https://api.clarifai.com/v1/token/" \
  -d "client_id=#{ENV['CLARIFAI_CLIENT_ID']}" \
  -d "client_secret=#{ENV['CLARIFAI_CLIENT_SECRET']}" \
  -d "grant_type=client_credentials"`
    query = JSON.parse(response)
    @clarifai_access_token = query['access_token']
  end
  
  def clarifai_call
    response = `curl "https://api.clarifai.com/v1/tag/" \
  -X POST --data-urlencode "url=#{@image_url}" \
  -H "Authorization: Bearer #{@clarifai_access_token}"`
    query = JSON.parse(response)
    @clarifai_tags = query['results'][0]['result']['tag']['classes']
  end

  IMAGE_TAGS = [
            'food',   
            'foodporn', 
            'foodie', 
            'yummie', 
            'nom', 
            'nomnom', 
            'hungry', 
            'cleaneating', 
            'healthy', 
            'delish', 
            'paleo', 
            'wine', 
            'vegan', 
            'vegetarian', 
            'italian', 
            'pizza', 
            'chinese', 
            'sushi', 
            'organic', 
            'organicfood', 
            'breakfast', 
            'lunch', 
            'dinner', 
            'dessert', 
            'foodgasm', 
            'love', 
            'instagood', 
            'tbt', 
            'photooftheday', 
            'cute', 
            'me', 
            'beautiful', 
            'happy', 
            'follow', 
            'followme', 
            'picoftheday', 
            'fashion', 
            'selfie', 
            'tagforlikes', 
            'summer', 
            'girl', 
            'friends', 
            'fun', 
            'instadaily', 
            'like', 
            'smile', 
            'like4like', 
            'igers', 
            'instamood', 
            'food', 
            'instalike', 
            'family', 
            'nofilter', 
            'repost', 
            'amazing', 
            'bestoftheday', 
            'art', 
            'likeforlike', 
            'style', 
            'life', 
            'nature', 
            'swag', 
            'follow4follow', 
            'sun', 
            'instagram', 
            'pretty', 
            'vscocam', 
            'tflers', 
            'sky', 
            'beach', 
            'beauty',
            'lol', 
            'fitness', 
            'music', 
            'followforfollow', 
            'hair', 
            'f4f', 
            'party', 
            'iphoneonly', 
            'cool', 
            'dog', 
            'girls', 
            'webstagram', 
            'l4l', 
            'photo', 
            'sunset', 
            'funny', 
            'iphonesia', 
            'night', 
            'baby', 
            'instasize', 
            'tweegram', 
            'my', 
            'cat', 
            'hot', 
            'foodporn', 
            'pink', 
            'black', 
            'vsco',
            'blue',
            'social',
            'branding',
            'socialmedia', 
            'sales', 
            'entrepreneur', 
            'entrepreneurship', 
            'marketing', 
            'branding', 
            'tech', 
            'business', 
            'contestalert', 
            'sweepstakes', 
            'giveaway', 
            'discount', 
            'travel', 
            'deal', 
            'smallbiz', 
            'success'
  ]
end
