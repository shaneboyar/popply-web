class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
    	t.string :title
    	t.timestamp :start

      t.timestamps null: false
    end
  end
end
