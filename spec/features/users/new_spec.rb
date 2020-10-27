require 'rails_helper'

RSpec.describe 'On the registration page' do
  it 'it has a form' do
    visit '/'

    click_on 'Register User'
    expect(current_path).to eq('/register/new')

    fill_in :name, with: 'Grant'
    fill_in :address, with: '123 Grant Ave.'
    fill_in :city, with: 'Denver'
    fill_in :state, with: 'CO'
    fill_in :zip, with: 80015
    fill_in :email, with: 'grant@coolguy.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_on 'Submit'

    expect(current_path).to eq('/profile')

    expect(page).to have_content('You are now registered and logged in!')
    expect(page).to have_content('Hello, Grant!')
  end
end