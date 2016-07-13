class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :membership, index: true, foreign_key: true
      t.references :contestant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
