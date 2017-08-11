class AddLevelToPostsAndComments < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :generated_by, :string, null: false, default: "stranger", after: :comments_count
    add_column :comments, :generated_by, :string, null: false, default: "stranger", after: :body
  end
end
