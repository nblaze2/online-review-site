# require 'rails_helper'
#
# RSpec.xdescribe "movies/edit", type: :view do
#   before(:each) do
#     @movie = assign(:movie, Movie.create!(
#       :title => "MyString",
#       :year => 1
#     ))
#   end
#
#   it "renders the edit movie form" do
#     render
#
#     assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
#
#       assert_select "input#movie_title[name=?]", "movie[title]"
#
#       assert_select "input#movie_year[name=?]", "movie[year]"
#     end
#   end
# end
