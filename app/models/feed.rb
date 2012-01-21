require 'open-uri'
require 'pp'

class Feed < ActiveRecord::Base
  def self.update_all_feeds
    Feed.where(:active => 1).shuffle.each do |feed|
#    Feed.where(:active => 1)[-1..-1].each do |feed|
      begin
         feed.fetch_newest
      rescue Exception => e
        puts "Something failed:\n\n#{e}]\n\n"
      end
    end    
  end

  def self.fetch_content(url)
    content = ""
    open(url) do |s| content = s.read end
    return content
  end

  def self.extract_urls(content, domain)
    # <link>http://feedproxy.google.com/~r/ProbloggerHelpingBloggersEarnMoney/~3/caim1fshKHk/</link>

    urls = content.scan(/<link>([^<]*)</i)
    File.open("content_dump.txt", "w") {|file| file.write(content)}
    urls.flatten!
    lines = IO.readlines(RAILS_ROOT + "/lib/flat_files/black_list_urls.txt")
    black_list = lines.map {|line| line.strip}
    urls = urls.map do |url|
      good = true
      black_list.each {|item| good = false if url.include?(item)}
#      good && url.size < 100 ? url : nil
      good ? url : nil
    end

    return urls.compact.uniq
  end


  def fetch_newest
    puts "\n\n**** Feed: #{self.name}"
    content = Feed.fetch_content(self.url)
    urls = Feed.extract_urls(content, self.domain)
    pp urls
    Post.add_posts_from_feed(urls, self.domain, self.category_id)
  end
end
