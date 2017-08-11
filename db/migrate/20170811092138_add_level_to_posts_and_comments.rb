class AddLevelToPostsAndComments < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :generated_by, :integer, null: false, default: 0, after: :comments_count
    add_column :comments, :generated_by, :integer, null: false, default: 0, after: :body
  end
end
