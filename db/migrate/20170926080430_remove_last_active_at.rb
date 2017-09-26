class RemoveLastActiveAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :last_active_at
  end
end
