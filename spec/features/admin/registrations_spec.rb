# encoding: utf-8

require 'spec_helper'

describe 'Admin registrations' do

  before { admin_login_as('admin', 'password') }

  describe 'registrations list' do
    context 'when there are no registrations' do
      specify do
        visit admin_registrations_path
        page.should have_content 'нет регистраций'
      end
    end

    context 'when there are registrations' do
      before { @registration = Registration.create name: 'Jurgen', email: 'jurgen@example.org' }

      specify 'should be on page' do
        visit admin_registrations_path
        page.should have_content 'Jurgen'
        page.should have_content 'jurgen@example.org'
      end
    end
  end

  describe 'confirmation' do
    before { @registration = Registration.create name: 'Jurgen', email: 'jurgen@example.org' }

    specify do
      visit admin_registrations_path
      within 'table tr' do
        click_on 'Подтвердить'
      end

      page.should have_content 'Статус подтвержден'
    end
  end
end
