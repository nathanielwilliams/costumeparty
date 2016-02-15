require "twitter"
module TwitterHelper

  @@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_KEY']
    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  end

  def posttweet(val)
    @@client.update(val)
  end

  def posttweetwithimage(id, con, pic)
    @fullpath = 'public/uploads/micropost/picture/' + id.to_s + '/' + pic.filename
    @@client.update_with_media(con, File.new(@fullpath ))
  end
end
