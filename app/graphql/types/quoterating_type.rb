module Types
  class QuoteratingType < Types::BaseObject
    field :id, ID, null: false
    field :quote_id, ID, null: false
    field :rating, Integer, null: false
  end
end
