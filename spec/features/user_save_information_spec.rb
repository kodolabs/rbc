# encoding: UTF-8
require 'spec_helper'

feature 'User save information', :js do
  scenario 'submit all forms' do
    visit root_path

    page.should have_no_selector('#new_questionary', :visible => true)
    page.should have_selector('#new_user', :visible => true)
    within '#new_user' do
      fill_in 'email', :with => 'user@mail.com'
      click_on 'Подписаться'
    end

    page.should have_selector('#new_questionary', :visible => true)
    within '#new_questionary' do
      check Questionary::LANGUAGES.first
      check Questionary::LANGUAGES.last
      choose Questionary::EXPERIENCE.first
      click_on 'Отправить'
    end

    page.should have_no_selector('#new_questionary', :visible => true)
    page.should have_no_selector('#new_user', :visible => true)
    page.should have_selector('#thankyou', :visible => true)
  end

  scenario 'submit invalid email' do
    visit root_path

    within '#new_user' do
      fill_in 'email', :with => ''
      click_on 'Подписаться'
    end

    page.should_not have_selector('#new_questionary', :visible => true)
  end
end
