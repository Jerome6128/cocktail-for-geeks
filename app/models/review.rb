class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, inclusion: { in: 1..5,
    message: "%{value} is not a valid rating" }
end
