# frozen_string_literal: true

require "rails_helper"

module Services
  RSpec.describe CreateQuote do
    subject(:service) { ->(quote_object:) { described_class.call(quote_object: quote_object) } }
    let(:quote_object) { Struct.new(:quote, :author) }

    describe "#call" do
      context "When services is called" do
        it "expect to create a Quote" do
          expect { service.call(quote_object: quote_object.new("This is a test quote", "Frank")) }.to change(Quote, :count).by(1)
        end
      end
    end
  end
end
