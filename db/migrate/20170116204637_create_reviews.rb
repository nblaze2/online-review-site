class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :movie, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
