class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.integer :allu
      t.integer :mau
      t.integer :wau
      t.integer :biau
      t.integer :dau

      t.integer :weekly_new_users
      t.integer :weekly_new_all_posts
      t.integer :weekly_new_uniq_posts
      t.integer :weekly_new_all_comments
      t.float :weekly_new_posts_ratio
      t.float :weekly_new_comments_ratio
      t.integer :weekly_new_all_conv
      t.integer :weekly_new_uniq_conv

      t.timestamps
    end
  end
end
