# encoding: UTF-8
require 'spec_helper'

feature 'User save information', :js do
  scenario 'submit all forms' do
    visit root_path
    click_on 'Мне интересно!'

    page.should have_selector('#new_user', :visible => true)
    within '#new_user' do
      fill_in 'user_email', :with => 'user@mail.com'
      click_on 'Добавить'
    end

    page.should have_selector('#new_questionary', :visible => true)
    within '#new_questionary' do
      fill_in 'questionary_question_1', :with => 'Foo man'
      choose 'B'
      check 'A'
      check 'C'
      click_on 'Отправить'
    end
  end

  scenario 'submit invalid email' do
    visit root_path
    click_on 'Мне интересно!'

    within '#new_user' do
      fill_in 'user_email', :with => ''
      click_on 'Добавить'
    end

    page.should_not have_selector('#new_questionary', :visible => true)
  end
end
