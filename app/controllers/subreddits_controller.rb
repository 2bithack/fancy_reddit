class SubredditsController < ApplicationController
  def create
      @subreddit = Subreddit.new(subreddit_params)
      @subreddit.save
      redirect_to @subreddit
  end
  def new
      @subreddit = Subreddit.new
  end

  def show
      @subreddit = Subreddit.find(params[:id])
  end

  private
  def subreddit_params
      params.require(:subreddit).permit(:title)
  end
end
