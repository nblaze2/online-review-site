class AddNullToBodyReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_null :reviews, :body, false
  end
end
