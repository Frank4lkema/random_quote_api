module Services
  class GetRandomQuote
    include Callable

    def call
      Quote.joins(:quote_ratings).group("quotes.id").order("AVG(quote_ratings.rating) DESC ").limit(1)
    end
  end
end
