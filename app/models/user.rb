# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :string
#  image_link      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	has_secure_password
	has_many :owned_groups, foreign_key: "owner_id", class_name: "Group"
	has_many :groups, through: :memberships
	has_many :memberships
	mount_uploader :image_link, AvatarUploader
	before_save   :downcase_email
	validates :first_name, presence: true
	validates :last_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }

private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end


end
