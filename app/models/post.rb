# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy
end
