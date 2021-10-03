module Queries
  class GetQuote < Queries::BaseQuery
    type Types::QuoteType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Quote.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Quote does not exist.")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(", ")}")
    end
  end
end
