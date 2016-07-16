class Key < ActiveRecord::Base
	belongs_to :show
	belongs_to :contestant
end
