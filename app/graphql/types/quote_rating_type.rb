module Types
  class QuoteRatingType < Types::BaseObject
    field :id, ID, null: false
    field :quote_id, ID, null: false
    field :rating, Integer, null: false
  end
end
