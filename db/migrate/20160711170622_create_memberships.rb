class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
		t.references :user
		t.references :group

      t.timestamps null: false
    end
  end
end
