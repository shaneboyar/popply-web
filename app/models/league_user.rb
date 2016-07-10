class LeagueUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :league
	default_scope -> { order(score: :desc) }
end
