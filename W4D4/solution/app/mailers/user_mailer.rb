class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url  = 'http://cats.com/login'
    mail(to: "eunnah@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
