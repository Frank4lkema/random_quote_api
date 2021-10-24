module Services
  class CreateQuote
    include Callable

    def initialize(quote_object:)
      @quote_object = quote_object
    end

    def call
      Quote.create(quote: @quote_object.quote, author: @quote_object.author)
    end
  end
end
