require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
      @post = posts(:one)
      @subreddit = subreddits(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get new" do
    get new_subreddit_post_url(@subreddit.id)
    assert_response :success
  end

  test "should create post" do
    post subreddit_posts_url(@subreddit.id), params: { "post": { "title": @post.title, "body": @post.body } }
    assert_difference 'Post.count' do
        assert_response :redirect
        follow_redirect!
        assert_response :success
    end
  end

end
