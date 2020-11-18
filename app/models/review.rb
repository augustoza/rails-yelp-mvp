RATING = (0..5).to_a

class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :rating, inclusion: { in: RATING, message: 'Not a valid rating (choose a value between 0 and 5)' }
end
