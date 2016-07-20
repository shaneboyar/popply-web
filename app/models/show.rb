# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  title      :string
#  start      :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Show < ActiveRecord::Base
	has_many :contestants
	has_many :show_weeks, dependent: :destroy
	has_many :keys
end
