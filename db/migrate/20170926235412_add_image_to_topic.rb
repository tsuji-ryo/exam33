class AddImageToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :image, :text
  end
end
