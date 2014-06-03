class AdminMailer < ActionMailer::Base
  default from: "do_not_reply@paulbonneville.com"

  def new_user_waiting_for_approval(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: ENV['ADMIN_EMAIL'], subject: "User waiting for approval: #{@user.email}")
  end

  def new_user_approved(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'Your account has been approved')
  end
end
