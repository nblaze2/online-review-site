# require 'rails_helper'
#
# feature 'authenticated user adds a movie', %q(
#
#   As an authenticated user
#   I want to add an item
#   So that others can review it
#
# ) do
#
#   scenario 'successfully creates a movie' do
#     visit '/'
#     click_on 'Sign up'
#     fill_in 'Email', with: 'test@dummy.com'
#     fill_in 'Password', with: '1234abcd'
#     fill_in 'Password confirmation', with: '1234abcd'
#     click_on 'Create Account'
#     click_on 'New Movie'
#     expect(page).to have_content('New Movie')
#     fill_in 'Title', with: 'Batman'
#     fill_in 'Year', with: '1989'
#     click_on 'Create Movie'
#
#     expect(page).to have_content('Movie was successfully created.')
#     expect(page).to have_content('Reviews')
#   end
# end
#
# feature 'authenticated user views movie information', %q(
#
#   As an authenticated user
#   I want to view a list of items
#   So that I can pick items to review
#
# ) do
#
#   scenario 'successfully views a list of movies' do
#     visit '/'
#     click_on 'Sign up'
#     fill_in 'Email', with: 'test@dummy.com'
#     fill_in 'Password', with: '1234abcd'
#     fill_in 'Password confirmation', with: '1234abcd'
#     click_on 'Create Account'
#     click_on 'New Movie'
#     expect(page).to have_content('New Movie')
#     fill_in 'Title', with: 'Batman'
#     fill_in 'Year', with: '1989'
#     click_on 'Create Movie'
#
#     expect(page).to have_content('Movie was successfully created.')
#     expect(page).to have_content('Reviews')
#   end
# end
#
# feature 'authenticated user views movie information', %q(
#
#   As an authenticated user
#   I want to view the details about an item
#   So that I can get more information about it
#
#   ) do
#
#   scenario 'successfully views details of a movie' do
#     visit '/'
#     click_on 'Sign up'
#     fill_in 'Email', with: 'test@dummy.com'
#     fill_in 'Password', with: '1234abcd'
#     fill_in 'Password confirmation', with: '1234abcd'
#     click_on 'Create Account'
#     click_on 'New Movie'
#     expect(page).to have_content('New Movie')
#     fill_in 'Title', with: 'Batman'
#     fill_in 'Year', with: '1989'
#     click_on 'Create Movie'
#
#     expect(page).to have_content('Movie was successfully created.')
#     expect(page).to have_content('Reviews')
#   end
# end
