class AddUserRefToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_reference :feeds, :user, foreign_key: true
  end
end
