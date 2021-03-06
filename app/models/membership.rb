# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  score      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ActiveRecord::Base
	belongs_to :group
	belongs_to :user
	has_many :picks, dependent: :destroy
	has_many :contestants, through: :picks
	default_scope -> { order(score: :desc) }

  def made_all_picks?
    total_picks = 0
    group.show.show_weeks.each do |week|
      total_picks += week.picklimit
    end
    picks.count == total_picks
  end

  def top_four
    top_four_week = group.show.show_weeks.find_by(picklimit: 4).week
    top_four_picks = []
    picks.where(week: top_four_week).each do |pick|
      top_four_picks.push(pick)
    end
  end

end