class SubredditsController < ApplicationController
  def create
      @subreddit = Subreddit.new(subreddit_params)
      @subreddit.save
      redirect_to @subreddit
  end
  def new
      @subreddit = Subreddit.new
  end
  def index
      @posts = Post.all
      @subreddits = Subreddit.all
      @subreddit = Subreddit.new
  end
  def show
      @subreddit = Subreddit.find(params[:id])
  end
  def destroy
      @subredditIndex = subreddit_post_path
      @subreddit = Subreddit.find(params[:subreddit_id])
      @subreddit.destroy
      redirect_to @subredditIndex

  end
  private
  def subreddit_params
      params.require(:subreddit).permit(:title)
  end
end
