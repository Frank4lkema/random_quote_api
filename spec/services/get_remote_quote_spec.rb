# frozen_string_literal: true

require "rails_helper"

module Services
  RSpec.describe GetRemoteQuote do
    subject { described_class.call }

    describe "#call" do
      it "Has attributes quote and author" do
        expect(subject).to respond_to(:quote)
        expect(subject).to respond_to(:author)
      end
    end
  end
end
