class QuoteRating < ApplicationRecord
  # model association
  belongs_to :quote, required: true

  # validations
  validates_presence_of :rating
  validates :rating, inclusion: {in: 1..5, message: "Rating should be between 1 and 5"}
end
