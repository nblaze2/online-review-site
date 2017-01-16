require 'rails_helper'

feature 'unauthenticated user signs in', %q(

  As an unauthenticated user
  I want to sign in
  So that I can post items and review them

) do

  scenario 'successfully signs in' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password confirmation', with: '1234abcd'
    click_on 'Create Account'
    click_on 'Sign out'

    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign out')
  end
end

feature 'authenticated user signs out', %q(

  As an authenticated user
  I want to sign out
  So that no one else can post items or reviews on my behalf

) do

  scenario 'successfully signs out' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password confirmation', with: '1234abcd'
    click_on 'Create Account'
    expect(page).to have_content('Sign out')
    click_on 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
end

feature 'authenticated user updates information', %q(

  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date

) do

  scenario 'successfully updates email address' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password confirmation', with: '1234abcd'
    click_on 'Create Account'
    click_on 'Edit account'
    expect(page).to have_content('Edit User')
    fill_in 'Email', with: 'test2@dummy.com'
    fill_in 'Current password', with: '1234abcd'
    click_on 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'successfully updates password' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password confirmation', with: '1234abcd'
    click_on 'Create Account'
    click_on 'Edit account'
    expect(page).to have_content('Edit User')
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234asdf'
    fill_in 'Password confirmation', with: '1234asdf'
    fill_in 'Current password', with: '1234abcd'
    click_on 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end
end

feature 'authenticated user deletes an account', %q(

  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

) do

  scenario 'successfully deletes an account' do
    visit '/'
    click_on 'Sign up'
    fill_in 'Email', with: 'test@dummy.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password confirmation', with: '1234abcd'
    click_on 'Create Account'
    click_on 'Edit account'
    expect(page).to have_content('Unhappy?')
    click_on 'Cancel my account'
    page.driver.browser.switch_to.confirm.accept
    # click_on 'OK'


    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
  end
end
