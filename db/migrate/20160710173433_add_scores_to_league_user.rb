class AddScoresToLeagueUser < ActiveRecord::Migration
  def change
    add_column :league_users, :score, :integer
  end
end
