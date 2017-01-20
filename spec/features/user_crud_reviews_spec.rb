require 'rails_helper'

feature 'authenticated user adds a review for a movie', %q(

  As an authenticated user
  I want to add a review
  So that others can read it

) do

  scenario 'successfully creates a movie review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Cop Out', year: '2010', user_id: user.id)
    visit '/'
    expect(page).to have_content('Cop Out')
    click_on 'Details/Reviews'
    click_on 'Post a Review'
    fill_in 'Title', with: 'Buddy Cop movies are not dead.'
    fill_in 'Body', with: 'This farsical look at buddy cop movies makes fun of itself at every turn. The movie is completely dependent on the personalities of Willis and Morgan. They have excellent chemistry.'
    fill_in 'Rating', with: '89'
    click_on 'Create Review'

    expect(page).to have_content('Review was successfully created.')
    expect(page).to have_content('Buddy Cop movies are not dead.')
  end
end

feature 'authenticated user views list of reviews for a movie', %q(

  As an authenticated user
  I want to view a list of reviews for a movie
  So that I review what people said about the movie

) do

  scenario 'successfully views a list of reviews for a movie' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, year: '1984', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: 'mama bear steals the show', movie_id: first_movie.id, user_id: user.id)
    second_review = FactoryGirl.create(:review, title: 'papa bear stole the show', movie_id: first_movie.id, user_id: user.id)
    third_review = FactoryGirl.create(:review, title: 'Shaq as baby bear was show stopper', movie_id: first_movie.id, user_id: user.id)
    fourth_review = FactoryGirl.create(:review, title: 'Goldy was a dud', movie_id: first_movie.id, user_id: user.id)

    visit '/'
    click_on 'Details/Reviews'
    expect(page).to have_content(first_movie.title)
    expect(page).to have_content(first_review.title)
    expect(page).to have_content(second_review.title)
    expect(page).to have_content(third_review.title)
    expect(page).to have_content(fourth_review.title)
  end
end

feature 'authenticated user updates a review', %q(

  As an authenticated user
  I want to update the details of a review
  So that I can correct errors and provide new information

  ) do

  scenario 'successfully updates details of a review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: "Die Hard", year: '1984', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: "Rock Hard", body: "That movie rocks! Hard!", movie_id: first_movie.id, user_id: user.id)

    visit '/'

    click_on 'Details/Reviews'
    click_on 'Show'
    click_on 'Edit'
    fill_in 'Title', with: 'Awesome party at Nakatomi Towers!'
    fill_in 'Body', with: 'Welcome to the party pall!'
    fill_in 'Rating', with: '97'
    click_on 'Update Review'
    expect(page).to have_content('Die Hard')
    expect(page).to have_content('Awesome party at Nakatomi Towers!')
  end
end

feature 'authenticated user deletes a review', %q(

  As an authenticated user
  I want to delete a movie's review
  So that no one can see it

  ) do

  scenario 'successfully deletes a review of a movie' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, year: '1984', user_id: user.id)
    first_review = FactoryGirl.create(:review, title: "Rock Hard", body: "That movie rocks! Hard!", movie_id: first_movie.id, user_id: user.id)

    visit '/'

    click_on 'Details/Reviews'
    expect(page).to have_content(first_review.title)
    click_on 'Show'
    click_on 'Destroy'
    expect(page).to_not have_content('Rock Hard')
    expect(page).to_not have_content('Show')
  end
end
