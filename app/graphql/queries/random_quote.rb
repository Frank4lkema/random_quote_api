module Queries
  class RandomQuote < Queries::BaseQuery
    type [Types::QuoteType], null: false

    def resolve
      ::Services::GetRandomQuote.call
    end
  end
end
