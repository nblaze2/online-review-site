class Review < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { maximum: 250 }

  validates :rating, numericality: true
  validates :rating, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { less_than_or_equal_to: 100 }
  belongs_to :user
  belongs_to :movie
  has_many :votes, dependent: :destroy
end
