# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ActiveRecord::Base
	belongs_to :group
	belongs_to :user
	has_many :picks, dependent: :destroy
	has_many :contestants, through: :picks
	default_scope -> { order(score: :desc) }
end
