class RandomQuotesController < ApplicationController
  def index
    @random_quote = ::Queries::GetRandomQuote.call
    json_response(@random_quote)
  end
end
