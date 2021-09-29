# frozen_string_literal: true

require "rails_helper"

RSpec.describe QuoteRating, type: :model do
  context "associations" do
    it { should belong_to(:quote) }
  end

  context "validations" do
    it { should validate_presence_of(:rating) }

    describe "rating" do
      context "rating should be between 1 and 5" do
        let(:quote) { build(:quote) }
        subject(:rating) { build(:quote_rating, rating: 8, quote: quote) }
        it "is invalid" do
          rating.validate

          expect(rating.errors[:rating]).to include("Rating should be between 1 and 5")
        end
      end
    end
  end
end
