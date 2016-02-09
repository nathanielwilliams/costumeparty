require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "password_reset" do
    user = users(:hulk)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Jabroni Alert: Password Reset Requested", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

end
