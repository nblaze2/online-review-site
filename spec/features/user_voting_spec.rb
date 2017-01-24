require 'rails_helper'

feature 'authenticated user votes on a review for a movie', %q(

  As an authenticated user
  I want to vote on a review
  So that others can see which reviews are best

) do

  scenario 'successfully upvotes on a movie review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Cop Out', year: '2010', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user.id)
    visit '/'
    expect(page).to have_content('Cop Out')
    click_on 'Details/Reviews'
    click_on '+1'
    expect(page).to have_content('1 vote')
    expect(page).to have_content('Rating Score: 1')
  end

  scenario 'successfully downvotes on a movie review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Cop Out', year: '2010', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user.id)
    visit '/'
    expect(page).to have_content('Cop Out')
    click_on 'Details/Reviews'
    click_on '-1'
    expect(page).to have_content('1 vote')
    expect(page).to have_content('Rating Score: -1')
  end

  scenario 'successfully deletes a vote on a movie review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Cop Out', year: '2010', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user.id)
    visit '/'
    expect(page).to have_content('Cop Out')
    click_on 'Details/Reviews'
    click_on '-1'
    expect(page).to have_content('1 vote')
    expect(page).to have_content('Rating Score: -1')
    click_on '+1'
    expect(page).to have_content('1 vote')
    expect(page).to have_content('Rating Score: 0')
  end

  scenario 'fails to vote on a movie review' do
    user = FactoryGirl.create(:user)
    first_movie = FactoryGirl.create(:movie, title: 'Cop Out', year: '2010', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user.id)
    visit '/'
    expect(page).to have_content('Cop Out')
    click_on 'Details/Reviews'
    click_on '-1'
    expect(page).to have_content('You must be logged in.')
  end
end
