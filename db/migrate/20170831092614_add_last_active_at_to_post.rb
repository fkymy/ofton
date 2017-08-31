class AddLastActiveAtToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :last_active_at, :datetime, default: Time.now, null: false

    reversible do |dir|
      dir.up { Post.update_all('last_active_at=created_at') }
    end
  end
end
