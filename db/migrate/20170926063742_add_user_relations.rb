class AddUserRelations < ActiveRecord::Migration[5.1]
  def change
    # allow null
    add_reference :posts, :user, index: true
    add_reference :comments, :user, index: true

    reversible do |dir|
      dir.up { Post.update_all('user_id=1') }
      dir.up { Comment.update_all('user_id=1') }
    end
  end
end
