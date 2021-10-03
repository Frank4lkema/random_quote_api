module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :get_quote, resolver: Queries::GetQuote
    field :get_quotes, resolver: Queries::GetQuotes
    field :random_quote, resolver: Queries::RandomQuote
  end
end
