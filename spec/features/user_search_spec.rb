require 'rails_helper'

feature 'user searches for a movie', %q(

  As a user
  I want to search a list of movies
  So that I can quickly find the movie I am looking for

) do

  scenario 'successfully seaches a list of movies' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    first_movie = FactoryGirl.create(:movie, title: 'Die Hard', year: '1988', user_id: user.id)
    second_movie = FactoryGirl.create(:movie, title: 'Deadpool', year: '2016', user_id: user.id)
    third_movie = FactoryGirl.create(:movie, title: 'Die Hard 2', year: '1990', user_id: user.id)

    visit '/'
    fill_in 'search', with: 'dead'
    click_on 'Search'
    expect(page).to have_content('Deadpool')
  end
end
