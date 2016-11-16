class PostsController < ApplicationController
  def index
      @posts = Post.all
      @subreddits = Subreddit.all
  end
  def new
      @subreddit = Subreddit.find(params[:subreddit_id])
      @post = Post.new
  end

  def create
      
  end

end
