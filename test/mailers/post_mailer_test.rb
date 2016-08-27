require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "view_new_post" do
    mail = PostMailer.view_new_post
    assert_equal "View new post", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
