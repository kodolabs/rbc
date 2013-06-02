# encoding: utf-8

require 'spec_helper'

describe 'Registration', :focus do
  specify 'filling the form' do
    visit '/'
    click_on 'Регистрация'
    fill_in_registration_form
    page.should have_content 'Спасибо'
  end

  specify 'filling the form with empty data' do
    visit new_registration_path
    fill_in_registration_form '', ''
    page.should_not have_content 'Спасибо'
    page.should have_content 'Запишите меня на курсы'
  end
end
