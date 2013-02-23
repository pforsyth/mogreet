module Mogreet
  class Media
    def initialize(client)
      @client = client
    end
    def list(options = {})
      response = @client.class.get('/cm/media.list')
      Hashie::Mash.new(response.parsed_response).response
    end    
  end
end
