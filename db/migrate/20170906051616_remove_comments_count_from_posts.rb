class RemoveCommentsCountFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :comments_count
  end
end
