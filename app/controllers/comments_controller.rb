class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to subreddit_post_path(@post.subreddit, @post)
    else
      redirect_to subreddit_post_path(@post.subreddit, @post)
      flash[:notice] = "Comment could not be saved."
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
