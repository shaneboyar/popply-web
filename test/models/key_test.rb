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

require 'test_helper'

class KeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
