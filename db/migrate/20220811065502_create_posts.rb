class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.belongs_to user, foreign_key: true, index: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
