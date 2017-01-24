require 'rails_helper'

feature 'user with admin role views a list of users', %q(

  As an admin user
  I want to see a list of users
  So that I can moderate the users

) do

  scenario 'admin sees list of users' do
    user = FactoryGirl.create(:user, role: 'admin')
    user1 = FactoryGirl.create(:user, email: 'red@mydog.com')
    user2 = FactoryGirl.create(:user, email: 'jogi@mydog.com')
    user3 = FactoryGirl.create(:user, email: 'bowie@mydog.com')
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Die Hard 2', year: '1990', user_id: user.id)

    visit '/'
    click_on 'Admin Tools'
    expect(page).to have_content('ADMIN TOOLS')
    expect(page).to have_content('Users')
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user3.email)
    expect(page).to have_content('Movies')
    expect(page).to have_content('Reviews')
  end
end

feature 'user with admin role deletes a user', %q(

  As an admin user
  I want to delete a user
  So that I can remove unwanted users

) do

  scenario 'admin deletes a user' do
    user = FactoryGirl.create(:user, role: 'admin')
    user1 = FactoryGirl.create(:user, email: 'red@mydog.com')
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Die Hard 2', year: '1990', user_id: user.id)

    visit '/'
    click_on 'Admin Tools'
    expect(page).to have_content('ADMIN TOOLS')
    expect(page).to have_content(user1.email)
    click_on 'Delete User'
    expect(page).to_not have_content(user1.email)
  end
end

feature 'user with admin role deletes a movie', %q(

  As an admin user
  I want to delete a movie
  So that I can remove unwanted movies

) do

  scenario 'admin deletes a movie' do
    user = FactoryGirl.create(:user, role: 'admin')
    user1 = FactoryGirl.create(:user, email: 'red@mydog.com')
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Die Hard 2', year: '1990', user_id: user1.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user1.id)

    visit '/'
    click_on 'Admin Tools'
    expect(page).to have_content('ADMIN TOOLS')
    expect(page).to have_content(first_movie.title)
    expect(page).to have_content(first_review.title)
    click_on 'Delete Movie'
    expect(page).to_not have_content(first_movie.title)
    expect(page).to_not have_content(first_review.title)
  end
end

feature 'user with admin role deletes a review', %q(

  As an admin review
  I want to delete a review
  So that I can remove unwanted reviews

) do

  scenario 'admin deletes a review' do
    user = FactoryGirl.create(:user, role: 'admin')
    user1 = FactoryGirl.create(:user, email: 'red@mydog.com')
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Die Hard 2', year: '1990', user_id: user1.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user1.id)

    visit '/'
    click_on 'Admin Tools'
    expect(page).to have_content('ADMIN TOOLS')
    expect(page).to have_content(first_review.title)
    click_on 'Delete Review'
    expect(page).to have_content(first_movie.title)
    expect(page).to_not have_content(first_review.title)
  end
end
