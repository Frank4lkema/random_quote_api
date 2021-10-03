module RestApi
  class QuotesController < ApplicationController
    def index
      @quotes = Quote.all
      json_response(@quotes)
    end

    def show
      @quote = Quote.find(params[:id])
      json_response(@quote)
    end
  end
end
