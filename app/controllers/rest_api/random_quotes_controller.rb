module RestApi
  class RandomQuotesController < ApplicationController
    def index
      @random_quote = ::Services::GetRandomQuote.call
      json_response(@random_quote)
    end
  end
end
