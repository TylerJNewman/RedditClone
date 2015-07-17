class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub_id
      t.integer :author_id

      t.timestamps null: false
    end
    add_index :sub_id, :author_id
  end
end
