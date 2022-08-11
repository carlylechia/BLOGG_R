class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_count
      t.integer :comments_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
