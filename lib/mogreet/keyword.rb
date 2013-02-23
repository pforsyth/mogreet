module Mogreet
  class Keyword
    def initialize(client)
      @client = client
    end

    def list(options ={})
      response = @client.class.get('/cm/keyword.list', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end
    
    def check(options)
      response = @client.class.get('/cm/keyword.check', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end
    
    # campaign_id
    # keyword
    def add(options)
      response = @client.class.get('/cm/keyword.add', :query => options)
      Hashie::Mash.new(response.parsed_response).response            
    end
    
    # campaign_id
    # keyword
    def remove(options)
      response = @client.class.get('/cm/keyword.remove', :query => options)
      Hashie::Mash.new(response.parsed_response).response                  
    end
  end
end
