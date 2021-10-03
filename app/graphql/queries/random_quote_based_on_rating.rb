module Queries
  class RandomQuoteBasedOnRating < Queries::BaseQuery
    type [Types::QuoteType], null: false

    def resolve
      ::Queries::GetRandomQuoteBasedOnRating.call
    end
  end
end