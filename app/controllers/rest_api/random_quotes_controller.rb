module RestApi
  class RandomQuotesController < ApplicationController
    def index
      remote_random_quote = ::Services::GetRemoteQuote.call
      @random_quote = ::Services::CreateQuote.call(quote_object: remote_random_quote)
      json_response(@random_quote)
    end
  end
end
