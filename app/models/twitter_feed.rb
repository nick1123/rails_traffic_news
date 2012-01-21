require 'open-uri'
require 'pp'
require 'json/pure'
require 'net/http'
require 'uri'

class TwitterFeed < ActiveRecord::Base
  def self.update_all_feeds
    TwitterFeed.all.shuffle.each do |feed|
#    TwitterFeed.all[-1..-1].each do |feed|
#    TwitterFeed.all[0..0].each do |feed|
      feed.fetch_newest
    end    
  end

  def self.gen_twitter_url(handle)
    return "http://api.twitter.com/1/statuses/user_timeline.json?screen_name=#{handle}"
  end

  def self.get_destination_url(url)
    url = Net::HTTP.get_response(URI.parse(url))['location']
    if url.include?("feedproxy")
      url = Net::HTTP.get_response(URI.parse(url))['location']
    end
    
    return url
  end

  def self.get_domain(url)
    uri = URI.parse(url)
    domain = uri.host.to_s.gsub("www.", '')
    return domain
  end

  def fetch_newest
    puts "\n\n**** Twitter Feed: #{self.name}"
    url = TwitterFeed.gen_twitter_url(self.handle)
    content = Feed.fetch_content(url)
    content_hash = JSON.parse(content)
    content_hash.each do |tweet|
      tweet_text = tweet["text"]
      puts tweet_text
      urls = TwitterFeed.extract_urls(tweet_text)
      urls.each do |url|
        puts "  URL: #{url}"
        if Post.url_exists?(url) #&& nil
          puts "    URL already exists"
          next
        else
          add_new_post(url)
        end
      end

      puts ""
    end
    
#    Post.add_posts_from_feed(urls, self.domain, self.category_id)
  end

  def add_new_post(url)
    begin
      status = Post::STATUS_APPROVED

      title = Post.fetch_title(url)
      if title.size < 5
        puts "    Title is too short"
        status = Post::STATUS_FAILED
      end

      destination_url = TwitterFeed.get_destination_url(url)
      domain = TwitterFeed.get_domain(destination_url)
      puts "**** destination_url: #{destination_url}"

      Post.create(
        :url => url,
        :title => title,
        :domain => domain,
        :category_id => 8,
        :status_id => status,
        :votes => 0,
        :points => Post::DEFAULT_TWITTER_POINTS,
        :p_title => "Nick's Traffic Tricks",
        :p_url => "http://nickstraffictricks.com")
      puts "    Added Post: #{title}"
    rescue Exception => e
      puts "Something failed:\n\n#{e}]\n\n"
      Post.create(
        :url => url,
        :category_id => 8,
        :status_id => Post::STATUS_FAILED)
    end

  end

  def self.extract_urls(tweet_text)
    urls = "#{tweet_text} ".scan(/https?:\/\/[^'"#<>\s]+/i)
    return urls
  end



end
