# require 'rails_helper'
#
# RSpec.xdescribe "movies/index", type: :view do
#   before(:each) do
#     assign(:movies, [
#       Movie.create!(
#         :title => "Title",
#         :year => 2
#       ),
#       Movie.create!(
#         :title => "Title",
#         :year => 2
#       )
#     ])
#   end
#
#   it "renders a list of movies" do
#     render
#     assert_select "tr>td", :text => "Title".to_s, :count => 2
#     assert_select "tr>td", :text => 2.to_s, :count => 2
#   end
# end
