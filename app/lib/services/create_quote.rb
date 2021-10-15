module Services
  class CreateQuote
    include Callable

    def initialize(quote_object)
      @quote_object = quote_object
    end

    def call

    end
  end
end