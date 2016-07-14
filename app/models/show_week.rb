# == Schema Information
#
# Table name: show_weeks
#
#  id         :integer          not null, primary key
#  show_id    :integer
#  picklimit  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShowWeek < ActiveRecord::Base
  belongs_to :show
end
