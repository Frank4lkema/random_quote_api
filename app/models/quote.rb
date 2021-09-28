class Quote < ApplicationRecord
  # model association
  has_many :quote_ratings, dependent: :destroy

  #validations
  validates_presence_of :quote, :author
end
