class AddNullToUserIdReviews < ActiveRecord::Migration[5.0]
  def change
    change_column_null :reviews, :user_id, false
  end
end
