CATEGORY = %w(chinese italian japanese french belgian)

class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORY, message: "Invalid category" }
end
