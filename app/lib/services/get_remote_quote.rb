module Services
  class GetRemoteQuote
    include Callable

    def initialize
      @url = "http://quotes.stormconsultancy.co.uk/random.json"
      @quote_object = Struct.new(:quote,:author)
    end

    def call
      response = parse_json_response(get_remote_quote)
      @quote_object.new(response["quote"],response["author"])
    end

    private

    def get_remote_quote
      Faraday.get @url
    end

    def parse_json_response(response)
      JSON.parse(response.body)
    end
  end
end
