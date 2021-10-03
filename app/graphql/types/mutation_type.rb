module Types
  class MutationType < Types::BaseObject
    field :add_quote_rating, mutation: Mutations::AddQuoteRating
  end
end
