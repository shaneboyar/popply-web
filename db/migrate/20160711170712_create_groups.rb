class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.references :owner
    	t.string :title
    	t.references :show

      t.timestamps null: false
    end
  end
end
