class Group < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :members, through: :memberships, source: :user
	has_many :memberships
	has_one :show, foreign_key: "id", primary_key: "show_id"
end
