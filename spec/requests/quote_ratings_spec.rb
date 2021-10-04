# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Quote rating endpoint " do
  # Initialize the test data
  let!(:quote) { create(:quote) }
  let!(:quote_ratings) { create_list(:quote_rating, 20,:with_random_rating, quote_id: quote.id,) }
  let(:quote_id) { quote.id }
  let(:id) { quote_ratings.first.id }

  describe "GET /rest_api/quotes/:quote_id/quote_ratings" do
    before { get "/rest_api/quotes/#{quote_id}/quote_ratings" }

    context "when quote exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all quote ratings" do
        expect(json.size).to eq(20)
      end
    end

    context "when quotes does not exist" do
      let(:quote_id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/"Couldn't find Quote with /)
      end
    end
  end

  describe "GET /rest_api/quotes/:quote_id/quote_ratings/:id" do
    before { get "/rest_api/quotes/#{quote_id}/quote_ratings/#{id}" }

    context "when quote_rating exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns the quote_rating" do
        expect(json["id"]).to eq(id)
      end
    end

    context "when quote_rating does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find QuoteRating with /)
      end
    end
  end

  describe "POST /rest_api/quotes/:quote_id/quote_ratings/:id" do
    let(:valid_attributes) { {rating: 4} }

    context "when request attributes are valid" do
      before { post "/rest_api/quotes/#{quote_id}/quote_ratings", params: valid_attributes }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when an invalid request" do
      before { post "/rest_api/quotes/#{quote_id}/quote_ratings", params: {} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a failure message" do
        expect(response.body).to match(/Validation failed: Rating can't be blank/)
      end
    end
  end
end
