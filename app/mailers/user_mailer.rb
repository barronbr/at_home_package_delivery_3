class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You\'ve got mail!')
  end

end
