class Chat < ActiveRecord::Base
	validates :body, presence: true, length: {maximum: 2000}
	belongs_to :group
	belongs_to :user
end
