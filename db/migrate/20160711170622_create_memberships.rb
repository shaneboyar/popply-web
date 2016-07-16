class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
		t.references :user
		t.references :group
		t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
