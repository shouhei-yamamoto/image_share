class AddImagesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :text
  end
end
