# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :string
#  image_link      :string           default("http://i.imgur.com/Rt36YI5.jpg")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
	has_secure_password
	has_many :owned_groups, foreign_key: "owner_id", class_name: "Group"
	has_many :groups, through: :memberships
	has_many :memberships
end
