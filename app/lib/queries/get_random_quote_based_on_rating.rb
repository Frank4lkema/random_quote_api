module Queries
  class GetRandomQuoteBasedOnRating
    include Callable

    def call
      Quote.where(id: quote_ids_with_hig_average).order("random()").limit(1)
    end

    private

    def quote_ids_with_hig_average
      Quote.joins(:quote_ratings).group("quotes.id").pluck("id", " AVG(quote_ratings.rating) as avg_gain").map { |x| x.first if x.second > 3 }.compact
    end
  end
end
