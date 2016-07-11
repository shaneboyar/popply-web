class User < ActiveRecord::Base
	has_secure_password
	has_many :owned_leagues, foreign_key: "owner_id", class_name: "League"
	has_many :league_users, dependent: :destroy
	has_many :leagues, through: :league_users
end
