module Mogreet
  class Keyword
    def initialize(client)
      @client = client
    end

    def list(options ={})
      @client.get_request('/cm/keyword.list', options)
    end
    
    def check(options)
      @client.get_request('/cm/keyword.check', options)
    end
    
    # campaign_id
    # keyword
    def add(options)
      @client.get_request('/cm/keyword.add', options)
    end
    
    # campaign_id
    # keyword
    def remove(options)
      @client.get_request('/cm/keyword.remove', options)
    end
  end
end
