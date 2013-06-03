class MailPreview < MailView
  def registration
    reg = Registration.create name: 'Jurgen', email: 'jurgen@example.org'
    mail = UserMailer.registration(reg)
    reg.destroy
    mail
  end
end