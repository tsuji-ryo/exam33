class AddSelfimageToUser < ActiveRecord::Migration
  def change
    add_column :users, :selfimage, :text
  end
end
