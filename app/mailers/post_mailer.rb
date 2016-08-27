class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.view_new_post.subject
  #



  def view_new_post(member)
  	user = User.find(member.user_id)
  	@user = user
  	@group = Group.find(member.group_id)
    mail to: user.email, subject: "Someone just posted in your group"
  end
end
