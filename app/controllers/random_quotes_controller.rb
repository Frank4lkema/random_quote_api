class RandomQuotesController < ApplicationController

  def index
    @quotes = Quote.all
    json_response(@quotes)
  end
end