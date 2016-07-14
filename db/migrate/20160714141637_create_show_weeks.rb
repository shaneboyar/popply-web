class CreateShowWeeks < ActiveRecord::Migration
  def change
    create_table :show_weeks do |t|
      t.references :show, index: true, foreign_key: true
      t.integer :picklimit


      t.timestamps null: false
    end
  end
end
