require 'rails_helper'

feature 'user creates an account', %q(

  As a prospective user
  I want to create an account
  So that I can post items and review them

) do

  scenario 'successfully registers an account' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password confirmation', with: '1234abcd'
    click_on 'Create Account'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Edit account')
  end

  scenario 'fails registers an account' do
    visit '/'
    click_on 'Sign up'
    click_on 'Create Account'

    expect(page).to have_content('2 errors prohibited this user from being saved:')
    expect(page).to have_content('Sign up')
  end
end
