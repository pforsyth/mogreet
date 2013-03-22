module Mogreet
  class System
    def initialize(client)
      @client = client
    end
    def ping(options = {})
      @client.get_request('/moms/system.ping')      
    end    
  end
end
