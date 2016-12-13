class PostsController < ApplicationController
  def index
      @posts = Post.all
      @subreddits = Subreddit.all
      @subreddit = Subreddit.new
  end

  def new
      @subreddit = Subreddit.find(params[:subreddit_id])
      @post = Post.new
  end

  def create
      @subreddit = Subreddit.find(params[:subreddit_id])
      @post = @subreddit.posts.new(post_params)
      @post.user_id = session[:user_id]
      if @post.save
          redirect_to @subreddit
      else
          flash[:notice] = "Post could not be saved"
          redirect_to :back
      end
  end

  def show
      @post = Post.find(params[:id])
      @comment = @post.comments.new
  end

  def post_params
      params.require(:post).permit(:title, :body, :url)
  end

  def destroy
      @post = Post.find(params[:id])
      @subreddit = Subreddit.find(params[:subreddit_id])
      @post.destroy
      redirect_to @subreddit
  end

  def edit
      @post = Post.find(params[:id])

  end

  def update
      @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
          redirect_to subreddit_path(@post.subreddit)
      end
  end

end
