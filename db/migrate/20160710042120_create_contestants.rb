class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :image
      t.text :bio
      t.integer :age
      t.string :occupation

      t.timestamps null: false
    end
  end
end
