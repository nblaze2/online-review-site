require 'rails_helper'

feature 'authenticated user adds a movie', %q(

  As an authenticated user
  I want to add an item
  So that others can review it

) do

  scenario 'successfully creates a movie' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_on 'New Movie'
    expect(page).to have_content('New Movie')
    fill_in 'Title', with: 'Batman'
    fill_in 'Year', with: '1989'
    click_on 'Create Movie'

    expect(page).to have_content('Movie was successfully created.')
    expect(page).to have_content('Reviews')
  end
end

feature 'authenticated user views movie information', %q(

  As an authenticated user
  I want to view a list of items
  So that I can pick items to review

) do

  scenario 'successfully views a list of movies' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, user_id: user.id)
    second_movie = FactoryGirl.create(:movie, user_id: user.id)
    third_movie = FactoryGirl.create(:movie, user_id: user.id)
    fourth_movie = FactoryGirl.create(:movie, user_id: user.id)

    visit '/'

    expect(page).to have_content('Police Academy 1')
    expect(page).to have_content('Police Academy 4')
    expect(page).to have_content('1984')
    expect(page).to have_content('1987')
  end
end

feature 'authenticated user views movie information', %q(

  As an authenticated user
  I want to view the details about an item
  So that I can get more information about it

  ) do

  scenario 'successfully views details of a movie' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: "Die Hard", user_id: user.id)

    visit '/'

    click_on 'Details/Reviews'
    expect(page).to have_content('Die Hard')
    expect(page).to have_content('1988')
    expect(page).to have_content('Post a Review')
  end
end
