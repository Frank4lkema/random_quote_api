# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Quote rating endpoint " do
  # Initialize the test data
  let!(:quote) { create(:quote) }
  let!(:quote_ratings) { create_list(:quote_rating, 20, quote_id: quote.id, rating: 3) }
  let(:quote_id) { quote.id }
  let(:id) { quote_ratings.first.id }

  describe "GET /quotes/:quote_id/quote_ratings" do
    before { get "/quotes/#{quote_id}/quote_ratings" }

    context "when quote exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all todo items" do
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

  describe "GET /quotes/:quote_id/quote_ratings/:id" do
    before { get "/quotes/#{quote_id}/quote_ratings/#{id}" }

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

  describe "POST /quotes/:quote_id/quote_ratings/:id" do
    let(:valid_attributes) { {rating: 4} }

    context "when request attributes are valid" do
      before { post "/quotes/#{quote_id}/quote_ratings", params: valid_attributes }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when an invalid request" do
      before { post "/quotes/#{quote_id}/quote_ratings", params: {} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a failure message" do
        expect(response.body).to match(/Validation failed: Rating can't be blank/)
      end
    end
  end
  #
  # # Test suite for PUT /todos/:todo_id/items/:id
  # describe 'PUT /todos/:todo_id/items/:id' do
  #   let(:valid_attributes) { { name: 'Mozart' } }
  #
  #   before { put "/todos/#{todo_id}/items/#{id}", params: valid_attributes }
  #
  #   context 'when item exists' do
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #
  #     it 'updates the item' do
  #       updated_item = Item.find(id)
  #       expect(updated_item.name).to match(/Mozart/)
  #     end
  #   end
  #
  #   context 'when the item does not exist' do
  #     let(:id) { 0 }
  #
  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end
  #
  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find Item/)
  #     end
  #   end
  # end
  #
  # # Test suite for DELETE /todos/:id
  # describe 'DELETE /todos/:id' do
  #   before { delete "/todos/#{todo_id}/items/#{id}" }
  #
  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
