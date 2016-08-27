class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
