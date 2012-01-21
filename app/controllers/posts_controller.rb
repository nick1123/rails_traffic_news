class PostsController < ApplicationController
  protect_from_forgery :only => []

  def index
    @ip_address = request.remote_ip
    # Put everything in the session
    count = params[:count]
    session[:count] = count if count && Post::VALID_COUNTS.include?(count.to_i)
    session[:count] = Post::DEFAULT_COUNT if session[:count].nil?

    # If a count is passed in then a cid & new will not be passed in
    # and we should not overwrite the session vars
    if count.nil?
      session[:cid] = params[:cid]
      session[:new] = params[:new]
      session[:pid] = params[:pid]
    end

#    session[:admin] = 1 if params[:admin]

    # Populate vars from the session
    new = session[:new]
    cid = session[:cid]
    pid = session[:pid]
#    @admin = session[:admin]
    @count = session[:count].to_i

    hot_new = new ? "New" : "Hot"

    if pid
      post = Post.find(pid)
      @posts = Post.for_feed(post.domain, count)
      extra = ''
#      if @admin
#        feed = Feed.where(:domain => post.domain)[0]
#        extra = "(post_count: #{feed.post_count} vote_count: #{feed.vote_count})"
#      end
      @title = "What's new on <a href='http://#{post.domain}' target='_target'>#{post.domain}</a> #{extra}"
    else
      @title = "What's " + hot_new + " in " + (cid ? Post::CATEGORIES[cid.to_i] : "Internet Marketing")
      if new
        @posts = Post.newest(cid, @count)
      else
        @posts = Post.hot(cid, @count)
      end
    end
  end

  def update_vote
    ip_address = request.remote_ip
    id = params[:id]
    post = Post.find(id)
    return if post.ip_voted_already?(ip_address)
    post.votes += 1
    post.points += Post::POINTS_PER_VOTE
    post.ips << ip_address
    post.save
    feed = Feed.where(:domain => post.domain)[0]
    pp feed
    feed.vote_count += 1
    feed.save
    render :json => {:id => post.id, :votes => post.votes}
  end
end
