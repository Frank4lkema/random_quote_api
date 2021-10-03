module Queries
  class GetQuotes < Queries::BaseQuery

    type [Types::QuoteType], null: false

    def resolve
      Quote.all.order(created_at: :desc)
    end
  end
end