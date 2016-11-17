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
    @subreddit = Subreddit.find(params[:subreddit_id])
    @post = @subreddit.posts.new(post_params)
    if @post.save
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :url)
  end

end
