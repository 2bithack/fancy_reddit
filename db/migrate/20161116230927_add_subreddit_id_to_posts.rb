class AddSubredditIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :subreddit_id, :integer, index: true
  end
end
