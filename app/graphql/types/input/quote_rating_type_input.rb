module Types
  module Input
    class QuoteRatingInputType < Types::BaseInputObject
      argument :rating, Integer, required: true
      argument :quote_id, Id, required: true
    end
  end
end