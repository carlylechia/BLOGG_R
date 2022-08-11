class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true, index: true, counter_cache: true
      t.string :title
      t.text :text
      t.integer :comments_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
