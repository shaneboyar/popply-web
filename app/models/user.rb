class User < ActiveRecord::Base
	has_secure_password
	has_many :owned_group, foreign_key: "owner_id", class_name: "Group"
	has_many :groups, through: :memberships
	has_many :memberships
end
