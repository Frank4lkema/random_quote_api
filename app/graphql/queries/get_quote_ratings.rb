module Queries
  class GetQuoteRatings < Queries::BaseQuery
    type [Types::QuoteRatingType], null: false
    argument :quote_id, ID, required: true

    def resolve(quote_id)
      QuoteRating.where(quote_id).order(created_at: :desc)
    end
  end
end
