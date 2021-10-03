module Queries
  class RandomQuote < Queries::BaseQuery
    type [Types::QuoteType], null: false

    def resolve
      ::Queries::GetRandomQuote.call
    end
  end
end
