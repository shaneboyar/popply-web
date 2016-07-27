class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.references :group, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
