module Queries
  class GetRandomQuote
    include Callable

    def call
      Quote.order("random()").limit(1)
    end
  end
end

