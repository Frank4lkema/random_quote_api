# frozen_string_literal: true

require "rails_helper"

module Queries
  RSpec.describe GetRandomQuote do
    let!(:quotes) { create_list(:quote, 10) }
    subject { described_class.call }

    describe "#call" do
      it "returns 1 random chosen quote form the database" do
        expect(subject.count).to eq(1)
      end
    end
  end
end
