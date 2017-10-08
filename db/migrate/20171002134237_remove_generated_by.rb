class RemoveGeneratedBy < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :generated_by
    remove_column :comments, :generated_by
  end
end
