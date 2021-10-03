module Mutations
  class AddQuoteRating < Mutations::BaseMutation
    argument :params, Types::Input::QuoteRatingInputType, required: true

    field :quote_rating, Types::QuoteRatingType, null: false

    def resolve(params:)
      quote_rating_params = Hash params

      begin
        quote_rating = QuoteRating.create!(quote_rating_params)

        {quote_rating: quote_rating}
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(", ")}")
      end
    end
  end
end
