# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Quotes endpoint", type: :request do
  let!(:quotes) { create_list(:quote, 10) }
  let(:quote_id) { quotes.first.id }

  describe "GET /rest_apiquotes" do
    before { get "/rest_api/quotes" }

    it "returns quotes" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /rest_api/quotes/:id" do
    before { get "/rest_api/quotes/#{quote_id}" }

    context "when the record exists" do
      it "returns the quote" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(quote_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:quote_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Quote/)
      end
    end
  end
end
