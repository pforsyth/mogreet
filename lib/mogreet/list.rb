module Mogreet
  class List  
    def initialize(client)
      @client = client
    end
    
    def list(options ={})
      @client.get_request('/cm/list.list', options)      
    end

    def info(options ={})
      @client.get_request('/cm/list.info', options)      
    end

    # name
    def create(options ={})
      @client.get_request('/cm/list.create', options)      
    end

    # list_id
    # numbers
    def append(options ={})
      # TODO clone options?
      options[:numbers] = options[:numbers].join(',') if options[:numbers].is_a?(Array)
      @client.get_request('/cm/list.append', options)      
    end

    # list_id
    # numbers
    def prune(options ={})
      # TODO clone options?
      options[:numbers] = options[:numbers].join(',') if options[:numbers].is_a?(Array)
      @client.get_request('/cm/list.prune', options)      
    end

    # list_id
    # campaign_id
    # subject
    # message
    # content_id
    # content_url
    # to_name
    # from_name
    def send(options)      
      @client.get_request('/cm/list.send', options)
    end
    
    # list_id
    # format
    def download(options)
      @client.get_request('/cm/list.download', options)
    end

    # list_id
    # name
    def empty(options)
      @client.get_request('/cm/list.empty', options)
    end

    # list_id
    # name
    def destroy(options)
      @client.get_request('/cm/list.destroy', options)
    end

  end
end
