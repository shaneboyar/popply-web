# == Schema Information
#
# Table name: picks
#
#  id            :integer          not null, primary key
#  membership_id :integer
#  contestant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  week          :integer
#

class Pick < ActiveRecord::Base
  belongs_to :membership
  belongs_to :contestant
end
