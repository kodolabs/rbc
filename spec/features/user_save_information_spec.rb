# encoding: UTF-8
require 'spec_helper'

feature 'User save information', :js do
  scenario 'submit all forms' do
    visit root_path
    click_on 'Мне интересно!'

    page.should have_selector('#new_user', :visible => true)
    within '#new_user' do
      fill_in 'email', :with => 'user@mail.com'
      click_on 'Мне интересно!'
    end

    page.should have_selector('#new_questionary', :visible => true)
    within '#new_questionary' do
      choose Questionary::COURSE_FORMATS.first
      choose Questionary::YES_NO.first
      choose Questionary::EXPIRIENCE.first
      click_on 'Отправить'
    end
  end

  scenario 'submit invalid email' do
    visit root_path
    click_on 'Мне интересно!'

    within '#new_user' do
      fill_in 'email', :with => ''
      click_on 'Мне интересно!'
    end

    page.should_not have_selector('#new_questionary', :visible => true)
  end
end
