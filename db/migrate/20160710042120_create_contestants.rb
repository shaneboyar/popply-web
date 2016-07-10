class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :image
      t.text :bio

      t.timestamps null: false
    end
  end
end
