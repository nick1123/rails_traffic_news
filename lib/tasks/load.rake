require 'pp'

namespace :load do
  desc "feeds"
  task :feeds => :environment do
    feeds = []
    feeds << ["Nick's Traffic Tricks", "http://feeds.feedburner.com/NicksTrafficTricks", 6, "nickstraffictricks.com"]
    feeds << ["Think Traffic", "http://feeds.feedburner.com/ThinkTraffic", 6, "thinktraffic.net"]
    feeds << ["Social Media Today", "http://feeds.feedburner.com/socialmediatoday_allposts", 5, "socialmediatoday.com"]
    feeds << ["ViperChill", "http://feeds.feedburner.com/viperchill", 3, "viperchill.com"]
    feeds << ["Search Engine RoundTable", "http://feeds.seroundtable.com/SearchEngineRoundtable1", 6, "seroundtable.com"]
    feeds << ["State of Search", "http://www.stateofsearch.com/feed/", 6, "stateofsearch.com"]
    feeds << ["SE People", "http://www.searchenginepeople.com/feed", 6, "searchenginepeople.com"]
    feeds << ["SE Land", "http://feeds.searchengineland.com/searchengineland", 6, "searchengineland.com"]
    feeds << ["SEO.com Blog", "http://feeds.seo.com/seocom", 6, "seo.com"]
    feeds << ["Free SEO Tools", "http://feeds.feedburner.com/FreeSeoToolsAndMarkting", 6, "blog.sitesubmiturl.com"]
    feeds << ["Social Media Examiner", "http://www.socialmediaexaminer.com/feed/", 5, "socialmediaexaminer.com"]
    feeds << ["Pushing Social", "http://feeds.feedburner.com/PushingSocial", 3, "pushingsocial.com"]
    feeds << ["SE Journal", "http://feeds.feedburner.com/SearchEngineJournal", 6, "searchenginejournal.com"]
    feeds << ["Traffic Blogger", "http://feeds.feedburner.com/TrafficBlogger", 6, "thetrafficblogger.com"]
    feeds << ["Web SEO Analytics", "http://www.webseoanalytics.com/blog/feed/", 3, "webseoanalytics.com"]
    feeds << ["SEO Moz", "http://feeds.feedburner.com/seomoz", 3, "seomoz.org"]
    feeds << ["Traffic Gen Cafe", "http://feeds.feedburner.com/TrafficGenerationCafe", 6, "trafficgenerationcafe.com"]
    feeds << ["ProBlogger", "http://feeds.feedburner.com/ProbloggerHelpingBloggersEarnMoney", 1, "problogger.net"]
    feeds << ["Smart Bear", "http://feeds2.feedburner.com/blogspot/smartbear", 3, "blog.asmartbear.com"]
    feeds << ["David Risley", "http://www.davidrisley.com/feed/", 3, "davidrisley.com"]
    feeds << ["Chris Garrett", "http://feeds.feedburner.com/chrisgcom", 3, "chrisg.com"]
    feeds << ["Kikolani", "http://feeds.feedburner.com/kikolani", 3, "kikolani.com"]
    feeds << ["We Blog Better", "http://feeds.feedburner.com/WeBlogBetter", 1, "weblogbetter.com"]

    feeds << ["Sprout Social Insights", "http://feeds.feedburner.com/SproutInsights", 3, "sproutsocial.com"]
    feeds << ["DIY Blogger", "http://feeds.feedburner.com/DIYBloggerNet", 3, "diyblogger.net"]
    feeds << ["Steve Scott Site", "http://www.stevescottsite.com/feed", 3, "stevescottsite.com"]
    feeds << ["Alex Whalley", "http://feeds.feedburner.com/alexwhalley", 3, "alexwhalley.com"]
    feeds << ["YoungPrePro", "http://www.youngprepro.com/feed/", 3, "youngprepro.com"]
    feeds << ["The Sales Lion", "http://feeds.feedburner.com/TheSalesLion", 3, "thesaleslion.com"]
    feeds << ["Big Feet Marketing", "http://bigfeetmarketing.com/feed", 3, "bigfeetmarketing.com"]

    feeds << ["Grow Map", "http://feeds2.feedburner.com/gmprss", 3, "growmap.com"]
    feeds << ["Social Mouths", "http://feeds2.feedburner.com/Socialmouths", 3, "socialmouths.com"]
    feeds << ["Post Click Marketing", "http://feeds.feedburner.com/PostClickMarketing", 3, "postclickmarketing.com"]
    feeds << ["26 Week Plan", "http://feeds.feedburner.com/26weekplan", 3, "26weekplan.com"]
    feeds << ["Social Media Explorer", "http://feeds.feedburner.com/SocialMediaExplorer", 5, "socialmediaexplorer.com"]
    feeds << ["Techipedia", "http://feeds2.feedburner.com/techipedia", 3, "techipedia.com"]
    feeds << ["4 Hour Work Week", "http://www.fourhourworkweek.com/blog/feed/", 7, "fourhourworkweek.com"]
    feeds << ["Zen Habits", "http://feeds.feedburner.com/zenhabits", 7, "zenhabits.net"]
    feeds << ["Michelle MacPhearson", "http://www.michellemacphearson.com/feed/", 3, "michellemacphearson.com"]
    feeds << ["37 Signals", "http://feeds.feedburner.com/37signals/beMH", 3, "37signals.com"]
    feeds << ["Daily Blog Tips", "http://feeds2.feedburner.com/DailyBlogTips", 1, "dailyblogtips.com"]
    feeds << ["Gary Vaynerchuk", "http://garyvaynerchuk.com/rss", 3, "garyvaynerchuk.com"]
    feeds << ["Terry Dean", "http://feeds.feedburner.com/TerryDean", 3, "mymarketingcoach.com"]
    feeds << ["Web Design Ledger", "http://feeds.feedburner.com/WebDesignLedger", 4, "webdesignledger.com"]
    feeds << ["Blogcast FM", "http://blogcastfm.com/feed", 1, "blogcastfm.com"]
    feeds << ["Louis Gray", "http://feeds2.feedburner.com/LouisgraycomLive", 3, "blog.louisgray.com"]
    feeds << ["Jeff Sexton", "http://www.jeffsextonwrites.com/feed/", 1, "jeffsextonwrites.com"]
    feeds << ["Jay Baer", "http://www.convinceandconvert.com/feed/", 5, "convinceandconvert.com"]
    feeds << ["Skool of life", "http://theskooloflife.com/wordpress/feed/", 3, "theskooloflife.com"]
    feeds << ["WP Jedi", "http://www.wpjedi.com/feed/", 1, "wpjedi.com"]
    feeds << ["Technium", "http://feeds.feedburner.com/thetechnium", 3, "kk.org"]
    feeds << ["Experiments in Passive Income", "http://experimentsinpassiveincome.com/feed/", 3, "experimentsinpassiveincome.com"]
    feeds << ["NeuroMarketing", "http://feeds.feedblitz.com/neuromarketing", 3, "neurosciencemarketing.com"]
    feeds << ["Online Marketing Blog", "http://www.toprankblog.com/feed/", 3, "toprankblog.com"]
    feeds << ["By Bloggers", "http://feeds.feedburner.com/bybloggers", 2, "bybloggers.net"]
    feeds << ["Lynn Terry", "http://feeds.feedburner.com/wp-clicknewz", 3, "clicknewz.com"]
    feeds << ["BlogWorld", "http://www.blogworld.com/feed", 1, "blogworld.com"]
    feeds << ["Duct Tape Marketing", "http://feeds2.feedburner.com/ducttapemarketing/nRUD", 3, "ducttapemarketing.com"]
    feeds << ["Brian Solis", "http://feeds.feedburner.com/BrianSolis", 3, "briansolis.com"]
    feeds << ["Blogging Labs", "http://www.blogginglabs.com/feed/", 3, "blogginglabs.com"]
    feeds << ["Eisenberg", "http://feeds.feedburner.com/BryanEisenberg", 3, "bryaneisenberg.com"]
    feeds << ["MarkCollier", "http://feeds.feedburner.com/Mackcolliercom", 3, "mackcollier.com"]
    feeds << ["Graphic Alerts", "http://feeds.feedburner.com/graphicalerts", 4, "graphicalerts.com"]
    feeds << ["CopyBlogger", "http://feeds.copyblogger.com/copyblogger", 1, "copyblogger.com"]
    feeds << ["Harte of Marketing", "http://www.theharteofmarketing.com/feed", 3, "theharteofmarketing.com"]
    feeds << ["C-level Strategies", "http://feeds.feedburner.com/C-levelStrategiesAwakenings", 3, "lisapetrilli.com"]
    feeds << ["Shannon Paul", "http://feeds.feedburner.com/ShannonPaulsVeryOfficialBlog", 3, "veryofficialblog.com"]
    feeds << ["TwiTip", "http://feedproxy.google.com/Twitip", 5, "twitip.com"]
    feeds << ["BK MacDaddy", "http://feeds2.feedburner.com/bkmacdaddydesigns", 3, "bkmacdaddy.com"]
    feeds << ["Ghost Writer Dad", "http://feeds2.feedburner.com/ghostwriterdad", 1, "ghostwriterdad.com"]
    feeds << ["Lewis Howes", "http://feeds2.feedburner.com/lewishowes/vhhs", 3, "lewishowes.com"]
    feeds << ["Murlu", "http://feeds.feedburner.com/Murlu", 3, "murlu.com"]
    feeds << ["Unbounce", "http://feeds.feedburner.com/Unbounce", 3, "unbounce.com"]
    feeds << ["Tiny Buddha", "http://feeds.feedburner.com/tinybuddha", 7, "tinybuddha.com"]
    feeds << ["Prolific Living", "http://feeds.feedburner.com/prolificliving/blog", 7, "prolificliving.com"]
    feeds << ["Advanced Life Skills", "http://feeds.feedburner.com/advancedlifeskills/MClm", 7, "advancedlifeskills.com"]
    feeds << ["Jonathan Fields", "http://feeds2.feedburner.com/JonathanFields", 7, "jonathanfields.com"]
    feeds << ["Brass Tack Thinking", "http://feeds.feedburner.com/TheBrandBox", 3, "brasstackthinking.com"]
    feeds << ["Soshable", "http://feeds2.feedburner.com/Soshable", 5, "soshable.com"]
    feeds << ["Unicorn Free", "http://feeds.feedburner.com/unicornfree", 3, "unicornfree.com"]
    feeds << ["Smart Passive Income", "http://www.smartpassiveincome.com/feed/", 3, "smartpassiveincome.com"]
    feeds << ["Ari Herzog", "http://feeds.feedblitz.com/ariherzog", 5, "ariherzog.com"]
    feeds << ["Stand out Blogger", "http://feeds2.feedburner.com/StandOutBlogger", 1, "standoutblogger.com"]
    feeds << ["Outspoken Media", "http://feeds.outspokenmedia.com/outspokenmedia", 3, "outspokenmedia.com"]
    feeds << ["Tech to Software", "http://feeds.feedburner.com/TechnologytoSoftware", 3, "technologytosoftware.com"]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]
#    feeds << ["", "", 3, ""]

#    Bad RSS
#    feeds << ["Noupe Design", "http://feeds.feedburner.com/Noupe", 4, "noupe.com"]
#    feeds << ["HongKiat", "http://feeds2.feedburner.com/24thfloor", 4, "hongkiat.com"]
#    feeds << ["Smashing Magazine", "http://rss1.smashingmagazine.com/feed/", 4, "smashingmagazine.com"]
#    feeds << ["SEO Book", "http://www.seobook.com/feeds.shtml", 6, "seobook.com"]
#    feeds << ["Seth Godin", "http://sethgodin.typepad.com/seths_blog/index.rdf", 3, "sethgodin.typepad.com"]

#    Too slow
#    feeds << ["Practical Ecommerce", "http://www.practicalecommerce.com/articles.rss", 3, "practicalecommerce.com"]

#    Bad content
#    feeds << ["RB Keys", "http://feeds.feedburner.com/TheCashGiftingProgramBlog", 3, "cashwithatrueconscience.com"]

    feeds.each do |feed|
      f = Feed.where({:url => feed[1]})
      if f.size == 0
        url = feed[1]
        new_feed = Feed.create(:url => feed[1], :name => feed[0], :category_id => feed[2], :domain => feed[3])

        puts "Feed Added: #{new_feed.inspect}"
      end
    end
  end

  desc "feeds make inactive"
  task :inactivate_feeds => :environment do
    feeds = []
    feeds << ["ReelSEO", "http://feeds.feedburner.com/reelseo", 6, "reelseo.com"]
    feeds << ["Stay on Search", "http://feeds.feedburner.com/stayonsearch", 6, "stayonsearch.com"]
    feeds << ["AVC", "http://feeds.feedburner.com/avc", 3, "avc.com"]
    feeds << ["LifeHacker", "http://www.lifehacker.com/index.xml", 7, "lifehacker.com"]
    feeds << ["Self Improvement Saga", "http://feeds.feedburner.com/Selfimprovementsaga", 7, "blog.self-improvement-saga.com"]
    feeds << ["Mashable", "http://feeds.mashable.com/Mashable", 5, "mashable.com"]  #Too much junk!

    feeds.each do |feed|
      feed_objects = Feed.where({:url => feed[1]})
      if feed_objects.size > 0
        feed_object = feed_objects[0]
        feed_object.active = 0
        feed_object.save
        puts "Inactivating feed: #{feed_object.name}"
      end
    end
  end

  desc "twitter feeds"
  task :twitter_feeds => :environment do
    feeds = []
    feeds << ["Nick's Traffic Tricks", "NicksTraffic"]
    feeds << ["Kristi Hines", "kikolani"]
    feeds << ["Lara Kulpa", "larakulpa"]
    feeds << ["Andy Beal", "andybeal"]
    feeds << ["Kiesha", "krenee76"]
    feeds << ["Lynn Terry", "lynnterry"]
    feeds << ["Jade Craven", "jadecraven"]
    feeds << ["Leo Babauta", "zen_habits"]
    feeds << ["Seth Godin", "ThisIsSethsBlog"]
    feeds << ["Dr. Mani", "drmani"]
    feeds << ["Terry Dean", "TerryDean"]
    feeds << ["Paul Myers", "PaulMyers"]
    feeds << ["Michel Fortin", "michelfortin"]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]
#    feeds << ["", ""]

    feeds.each do |feed|
      handle = feed[1]
      f = TwitterFeed.where({:handle => handle})
      if f.size == 0
        new_feed = TwitterFeed.create(:name => feed[0], :handle => handle)

        puts "Twitter Feed Added: #{new_feed.inspect}"
      end
    end
  end

  desc "recent_rss"
  task :recent_rss => :environment do
    Feed.update_all_feeds
  end

  desc "recent_twitter"
  task :recent_twitter => :environment do
    TwitterFeed.update_all_feeds
  end

  desc "adjust_points"
  task :adjust_points => :environment do
    Post.adjust_points
  end
end

desc "update stuff"
task :update => :environment do
  Post.adjust_points
  TwitterFeed.update_all_feeds
  Feed.update_all_feeds
end
