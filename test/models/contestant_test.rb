# == Schema Information
#
# Table name: contestants
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :string
#  bio        :text
#  age        :integer
#  occupation :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  show_id    :integer
#

require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
