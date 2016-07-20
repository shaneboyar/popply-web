# == Schema Information
#
# Table name: keys
#
#  id            :integer          not null, primary key
#  show_id       :integer
#  contestant_id :integer
#  week          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Key < ActiveRecord::Base
	belongs_to :show
	belongs_to :contestant
end
