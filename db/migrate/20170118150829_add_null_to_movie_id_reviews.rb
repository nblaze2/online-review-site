class AddNullToMovieIdReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_null :reviews, :movie_id, false
  end
end
