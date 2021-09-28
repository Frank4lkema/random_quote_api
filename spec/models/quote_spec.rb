# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quote, type: :model do
  context "associations" do
    it { should have_many(:quote_ratings).dependent(:destroy) }
  end

  context  "validations" do
    it { should validate_presence_of(:quote) }
    it { should validate_presence_of(:author) }
  end


end