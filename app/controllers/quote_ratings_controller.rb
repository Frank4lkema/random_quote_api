class QuoteRatingsController < ApplicationController
  before_action :find_quote
  before_action :find_quote_rating, only: [:show]

  def index
    json_response(@quote.quote_ratings)
  end

  def show
    json_response(@quote_rating)
  end

  def create
    @quote.quote_ratings.create!(quite_rating_params)
    json_response(@quote, :created)
  end

  private

  def quite_rating_params
    params.permit(:rating)
  end

  def find_quote
    @quote = Quote.find(params[:quote_id])
  end

  def find_quote_rating
    @quote_rating = @quote.quote_ratings.find(params[:id]) if @quote
  end
end
