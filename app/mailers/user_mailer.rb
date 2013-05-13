#encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "contact@kodolabs.com"

  def welcome(email)
    mail to: email, subject: "Railskickstart: спасибо за регистрацию"
  end
end
