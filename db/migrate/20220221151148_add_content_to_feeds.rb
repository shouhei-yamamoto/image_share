class AddContentToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :content, :text
  end
end
