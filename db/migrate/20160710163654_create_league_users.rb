class CreateLeagueUsers < ActiveRecord::Migration
  def change
    create_table :league_users do |t|
    	t.references :league, index: true 
    	t.references :user, index: true

      t.timestamps null: false
    end
  end
end
