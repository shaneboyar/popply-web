# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  title      :string
#  show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :members, through: :memberships, source: :user
	has_many :memberships, dependent: :destroy
	has_one :show, foreign_key: "id", primary_key: "show_id"
end
