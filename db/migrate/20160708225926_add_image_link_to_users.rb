class AddImageLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_link, :string, default:"http://i.imgur.com/Rt36YI5.jpg"
  end
end
