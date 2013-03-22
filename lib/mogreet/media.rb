module Mogreet
  class Media
    def initialize(client)
      @client = client
    end
    def list(options = {})
      @client.get_request('/cm/media.list')
    end    
    
    def upload(options)
      @client.post_request('/cm/media.upload', options)
    end

    def destroy(options)
      @client.get_request('/cm/media.destroy', options)
    end
    
  end
end
