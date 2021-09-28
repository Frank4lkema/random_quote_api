class QuoteRating < ApplicationRecord
  # model association
  belongs_to :quote

  # validations
  validates_presence_of :liked
end
