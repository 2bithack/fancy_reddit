require 'test_helper'

class SubredditsControllerTest < ActionDispatch::IntegrationTest
  test "can view new subreddit form" do
    get new_subreddit_url
    assert_response :success
  end

  test "should create subtreddit" do
    post subreddits_url, params: { "subreddit": { "title": "fubar" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  

end
