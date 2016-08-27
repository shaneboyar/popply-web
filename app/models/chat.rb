# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chat < ActiveRecord::Base
	validates :body, presence: true, length: {maximum: 2000}
	belongs_to :group
	belongs_to :user
end
