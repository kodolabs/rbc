class MailPreview < MailView
  def registration
    reg = Registration.create name: 'Jurgen', email: 'jurgen@example.org'
    mail = UserMailer.registration(reg)
    reg.destroy
    mail
  end

  def confirm
    reg = Registration.create name: 'Jurgen', email: 'jurgen@example.org'
    mail = UserMailer.confirm(reg)
    reg.destroy
    mail
  end

  def cancel
    reg = Registration.create name: 'Jurgen', email: 'jurgen@example.org'
    mail = UserMailer.cancel(reg)
    reg.destroy
    mail
  end
end
