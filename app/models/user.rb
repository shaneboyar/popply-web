class User < ActiveRecord::Base
	has_secure_password
	has_many :posts, dependent: :destroy
	has_many :league_users, dependent: :destroy
	has_many :leagues, through: :league_users
end
