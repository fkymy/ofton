class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true, null: false
      t.string :author
      t.text :body, null: false

      t.timestamps
    end
  end
end
