# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/view_new_post
  def view_new_post
  	member = Membership.first
    PostMailer.view_new_post(member)
  end

end
