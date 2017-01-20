class AddUseridScoreToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :user_id, :integer, null: false, column_options: { null: false }
    add_column :votes, :score, :integer
  end
end
