class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.text :body, null: false
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
