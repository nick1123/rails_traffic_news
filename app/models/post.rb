require 'digest/sha1'

class Post < ActiveRecord::Base
  serialize :ips#, Array
  before_create :before

  CATEGORIES = 
  {
    1 => "Blogging / Writing",
    2 => "Ebooks / Email Marketing",
    3 => "Business / Marketing",
    4 => "Design / Graphics",
    5 => "Social Media",
    6 => "SEO / Traffic Generation",
    7 => "Motivational / Lifestyle Design",
    8 => "General",
  }

  VALID_COUNTS = [25,50,100,200]
  DEFAULT_COUNT = 25

  STATUS_PENDING   = 0
  STATUS_APPROVED  = 1
  STATUS_DUPLICATE = 2
  STATUS_FAILED    = 3

  QUANTITY = 100
  DEFAULT_TWITTER_POINTS = 100

  POINTS_PER_VOTE = 5_000

  def category
    return CATEGORIES[self.category_id]
  end

  def before
    self.ihash = Post.gen_hash
    self.ips = []
  end

  def title_for_web
    return self.title_display
  end

  def make_ips_array
    self.ips = [] if self.ips.nil? || self.ips.size >= 100
  end

  def ip_voted_already?(ip_address)
    make_ips_array
    return self.ips.include?(ip_address)
  end

  def self.add_posts_from_feed(urls, domain, category_id)
    urls.each do |url|
      puts "  Checking URL: #{url}"
      begin
        Post.add_single_post(url, domain, category_id)
      rescue
        puts "    Something Failed"
        Post.create(:url => url, :status_id => STATUS_FAILED)
      end
      puts ""
    end
  end

  def self.add_single_post(url, domain, category_id)
    if url_exists?(url)
      puts "    URL already exists"
      return
    end

    title = Post.fetch_title(url)

    status = Post.title_exists?(title, domain) ? Post::STATUS_DUPLICATE : Post::STATUS_APPROVED
    puts "    Title already Exists: #{title}" if status == Post::STATUS_DUPLICATE

    if title.size < 5
      puts "    Title is too short"
      status = Post::STATUS_FAILED
    end

    points = 2
    feed = Feed.where(:domain => domain)[0]
    ratio = 0.001
    ratio = feed.vote_count.to_f / feed.post_count if feed.post_count > 0
    ratio = 1 if ratio > 1

    #points = (Post::POINTS_PER_VOTE * ratio).to_i
    title_display = Post.get_title_display(title)

    Post.create(
      :url => url,
      :title => title,
      :title_display => title_display,
      :domain => domain,
      :category_id => category_id,
      :status_id => status,
      :votes => 0,
      :p_title => "Nick's Traffic Tricks",
      :points => points,
      :p_url => "http://nickstraffictricks.com")

    if status == Post::STATUS_APPROVED
      feed.post_count += 1
      feed.save
    end
    
    puts "    Added Post:\n    #{title.inspect} =>\n    #{title_display.inspect}"
  end

  def self.get_title_display(title)
    lines = IO.readlines(RAILS_ROOT + "/lib/flat_files/black_list_titles.txt")
    bad_titles = lines.map {|line| line.strip}
    bad_titles.each do |bad_title|
      title = title.gsub(bad_title, '')
    end

    return title.strip
  end

  def self.fetch_title(url)
    content = Feed.fetch_content(url)
    title = content.scan(/<title>([^<]*)</im)
#    return title.to_s.gsub("&amp;", "&").gsub("&#8217;", "'").gsub("&#8211;", '-').gsub("&#039;", "'").gsub("&mdash;", '-').gsub("&#8212;", '-').gsub("&raquo;", '>>').gsub("&#8220;", '"').gsub("&#8221;", '"').gsub("&#8230;", '...').gsub("&#160;", ' ').gsub("&#038;", "&").gsub("&quot;", '"').gsub("&laquo;", "|").strip.gsub(/\s+/m,' ')
    return title.to_s.strip.gsub(/\s+/m,' ')
  end

  def self.title_exists?(title, domain)
    Post.where(:title => title, :domain => domain).size > 0
  end

  def self.url_exists?(url)
    Post.where(:url => url).size > 0
  end

  def self.gen_hash
    hash = Digest::SHA1.hexdigest(Time.now.to_s + rand.to_s)
    return hash[0,8]
  end

  def self.hot(cid, count)
    order = "points DESC, created_at DESC"
    return Post.fetch_posts(order, cid, count)
  end

  def self.newest(cid, count)
    order = "created_at DESC"
    return Post.fetch_posts(order, cid, count)
  end

  def self.for_feed(domain, count)
    conditions = {:status_id => STATUS_APPROVED, :domain => domain}
    order = "created_at DESC"
    return Post.where(conditions).order(order).limit(count)
  end

  def self.fetch_posts(order, cid, count)
    conditions = {:status_id => STATUS_APPROVED}
    conditions[:category_id] = cid if cid
    return Post.where(conditions).order(order).limit(count)
  end

  def self.adjust_points
    posts = Post.where("points > 10 && status_id = #{Post::STATUS_APPROVED}")
    posts.each do |post|
      post.points *= 0.9
      post.save
    end
  end
end
