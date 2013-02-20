module Mogreet
  class System
    def initialize(client)
      @client = client
    end
    def ping(options = {})
      response = @client.class.get('/moms/system.ping')
      Hashie::Mash.new(response.parsed_response).response
    end    
  end
end
