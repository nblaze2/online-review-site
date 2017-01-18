class AddNullToTitleReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_null :reviews, :title, false
  end
end
