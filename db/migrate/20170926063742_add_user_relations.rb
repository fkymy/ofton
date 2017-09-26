class AddUserRelations < ActiveRecord::Migration[5.1]
  def change
    # allow null
    add_reference :posts, :user, index: true
    add_reference :comments, :user, index: true
  end
end
