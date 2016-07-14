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

class Contestant < ActiveRecord::Base
	belongs_to :show
	has_many :picks, dependent: :destroy
	has_many :memberships, through: :picks
end
