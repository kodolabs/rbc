# encoding: utf-8

def admin_login_as(login, password)
  page.driver.browser.authorize login, password
end

def fill_in_registration_form(email = 'user@example.org', name = 'john smith')
  fill_in 'registration_email', with: email
  fill_in 'registration_name', with: name
  click_on 'Отправить'
end
