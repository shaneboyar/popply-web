# == Schema Information
#
# Table name: show_weeks
#
#  id         :integer          not null, primary key
#  show_id    :integer
#  week       :integer
#  picklimit  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ShowWeekTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
