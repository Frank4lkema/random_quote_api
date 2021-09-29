require 'rails_helper'

RSpec.describe 'Random Quote endpoint', type: :request do
  let!(:quotes) { create_list(:quote, 10) }

  # Test suite for GET /todos
  describe 'GET /quotes' do
    before { get '/random_quotes' }

    it 'returns quotes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end