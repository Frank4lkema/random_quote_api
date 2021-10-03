# frozen_string_literal: true

require "rails_helper"

module Services
  RSpec.describe GetRandomQuote do
    let!(:quotes) { create_list(:quote, 10) }
    let(:first_quote) { quotes.first }
    let(:second_quote) { quotes.second }
    let!(:first_quote_ratings) { create_list(:quote_rating, 10, rating:3, quote: first_quote) }
    let!(:second_quote_ratings) { create_list(:quote_rating, 10, rating:5, quote: second_quote) }
    subject { described_class.call }

    describe "#call" do
      it "return the quote with the highest rating" do
        expect(subject.first).to eq(second_quote)
      end
    end
  end
end