class League < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :players, through: :league_users, source: :user, dependent: :destroy
	has_many :league_users
end
