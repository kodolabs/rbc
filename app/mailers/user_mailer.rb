#encoding: utf-8

class UserMailer < ActionMailer::Base
  CONTACT = 'support@railskickstart.com.ua'

  default from: CONTACT, bcc: CONTACT

  def welcome(email)
    mail to: email, subject: 'Railskickstart: будьте в курсе'
  end

  def registration(reg)
    @name = reg.name
    mail to: reg.email, subject: 'Railskickstart: спасибо за регистрацию'
  end

  def confirm(reg)
    @name = reg.name
    mail to: reg.email, subject: 'Railskickstart: подтверждение участия'
  end

  def cancel(reg)
    @name = reg.name
    mail to: reg.email, subject: 'Railskickstart: регистрация отменена'
  end

end
