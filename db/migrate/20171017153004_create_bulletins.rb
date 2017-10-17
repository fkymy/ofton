class CreateBulletins < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletins do |t|
      t.text :body, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
