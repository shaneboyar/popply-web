# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  image_link             :string
#  admin                  :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
	has_many :owned_groups, foreign_key: "owner_id", class_name: "Group", dependent: :destroy
	has_many :groups, through: :memberships
	has_many :memberships
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
	mount_uploader :image_link, AvatarUploader
	before_save   :downcase_email
	validates :first_name, presence: true
	validates :last_name, presence: true


private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end


end
