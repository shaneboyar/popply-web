class League < ActiveRecord::Base
	has_many :league_users, dependent: :destroy
	has_many :users, through: :league_users
end
