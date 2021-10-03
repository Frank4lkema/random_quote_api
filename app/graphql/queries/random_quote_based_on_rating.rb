module Queries
  class RandomQuoteBasedOnRating < Queries::BaseQuery
    type [Types::QuoteType], null: false

    def resolve
      ::Services::GetRandomQuote.call
    end
  end
end