# require 'rails_helper'
#
# RSpec.xdescribe "reviews/new", type: :view do
#   before(:each) do
#     assign(:review, Review.new(
#       :title => "MyString",
#       :body => "MyText",
#       :user => nil,
#       :movie => nil,
#       :rating => 1
#     ))
#   end
#
#   it "renders new review form" do
#     render
#
#     assert_select "form[action=?][method=?]", reviews_path, "post" do
#
#       assert_select "input#review_title[name=?]", "review[title]"
#
#       assert_select "textarea#review_body[name=?]", "review[body]"
#
#       assert_select "input#review_user_id[name=?]", "review[user_id]"
#
#       assert_select "input#review_movie_id[name=?]", "review[movie_id]"
#
#       assert_select "input#review_rating[name=?]", "review[rating]"
#     end
#   end
# end
