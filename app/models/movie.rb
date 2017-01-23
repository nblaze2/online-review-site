class Movie < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :year, presence: true
  validates :year, numericality: true, :inclusion => { :in => 1895..2025 }

  belongs_to :user
  has_many :reviews, dependent: :destroy

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end
end
