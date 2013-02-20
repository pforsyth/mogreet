module Mogreet
  class Keyword
    def initialize(client)
      @client = client
    end

    def list(options)
      response = @client.class.get('/cm/keyword.list', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end
  end
end