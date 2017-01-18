class AddColumnToMovies < ActiveRecord::Migration[5.0]
  def change
    change_table :movies do |t|
      t.belongs_to :user, foreign_key: true, null: false
    end
  end
end
