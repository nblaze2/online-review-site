class AddNullToYearMovies < ActiveRecord::Migration[5.0]
  def change
    change_column_null :movies, :year, false
  end
end
