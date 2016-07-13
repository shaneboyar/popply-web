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

require 'test_helper'

class PickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
