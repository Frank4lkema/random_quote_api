module Types
  class QuoteType < Types::BaseObject
    field :id, ID, null: false
    field :quote, String, null: false
    field :author, String, null: false
  end
end
