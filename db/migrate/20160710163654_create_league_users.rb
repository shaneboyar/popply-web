class CreateLeagueUsers < ActiveRecord::Migration
  def change
    create_table :league_users do |t|
    	t.belongs_to :league, index: true 
    	t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
