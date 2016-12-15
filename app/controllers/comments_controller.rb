class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user_id = session[:user_id]

    if @comment.save
      redirect_to subreddit_post_path(@post.subreddit, @post)
    else
      redirect_to subreddit_post_path(@post.subreddit, @post)
      flash[:notice] = "Comment could not be saved."
    end
  end
  
  def destroy
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
      @comment.destroy
      redirect_to @post
  end

  def edit
      @comment = Comment.find(params[:id])
  end

  def update
      @comment = Comment.find(params[:id])
      if @comment.update_attributes(comment_params)
          redirect_to subreddit_post_path(@post.subreddit, @post)
      end
  end
private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
