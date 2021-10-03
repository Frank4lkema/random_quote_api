module Queries
  class GetRandomQuoteBasedOnRating
    include Callable

    def call
      Quote.where(id: quote_ids_with_hig_average).order("random()").limit(1)
    end

    private

    def quote_ids_with_hig_average
      QuoteRating.select('quote_id').group('quote_id').average('rating').map { |x| x.first if x.second > 3 }.compact
    end
  end
end
