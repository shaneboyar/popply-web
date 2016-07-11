class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
   	  t.string :first_name
   	  t.string :last_name
   	  t.string :email
   	  t.string :password_digest
      t.string :image_link, default:"http://i.imgur.com/Rt36YI5.jpg"
   	  

      t.timestamps null: false
    end
  end
end
