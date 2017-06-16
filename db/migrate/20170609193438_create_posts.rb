class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :author
      t.text :body, null: false
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
