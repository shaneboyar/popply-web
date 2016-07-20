class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
    	t.references :show
    	t.references :contestant
    	t.integer :week

      t.timestamps null: false
    end
  end
end
