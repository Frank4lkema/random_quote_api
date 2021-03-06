# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Random Quote endpoint", type: :request do
  let!(:quotes) { create_list(:quote, 10) }
  let(:first_quote) { quotes.first }
  let(:second_quote) { quotes.second }
  let!(:first_quote_ratings) { create_list(:quote_rating, 10, rating: 3, quote: first_quote) }
  let!(:second_quote_ratings) { create_list(:quote_rating, 10, rating: 5, quote: second_quote) }

  describe "GET /rest_api/quotes" do
    before { get "/rest_api/random_quotes" }

    it "returns quotes" do
      expect(json).not_to be_empty
      expect(json).to be_a_kind_of(Hash)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
