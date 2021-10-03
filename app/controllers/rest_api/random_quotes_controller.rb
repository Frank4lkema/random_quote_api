module RestApi
  class RandomQuotesController < ApplicationController
    def index
      @random_quote = ::Queries::GetRandomQuoteBasedOnRating.call
      json_response(@random_quote)
    end
  end
end
