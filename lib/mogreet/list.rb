module Mogreet
  class List  
    def initialize(client)
      @client = client
    end
    
    def list(options ={})
      response = @client.class.get('/cm/list.list', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end

    def info(options ={})
      response = @client.class.get('/cm/list.info', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end

    # name
    def create(options ={})
      response = @client.class.get('/cm/list.create', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end

    # list_id
    # numbers
    def append(options ={})
      # TODO clone options?
      options[:numbers] = options[:numbers].join(',') if options[:numbers].is_a?(Array)
      response = @client.class.get('/cm/list.append', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end

    # list_id
    # numbers
    def prune(options ={})
      # TODO clone options?
      options[:numbers] = options[:numbers].join(',') if options[:numbers].is_a?(Array)
      response = @client.class.get('/cm/list.prune', :query => options)
      Hashie::Mash.new(response.parsed_response).response
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
      response = @client.class.get('/cm/list.send', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end
    
    # list_id
    # format
    def download(options)
      response = @client.class.get('/cm/list.download', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end

    # list_id
    # name
    def empty(options)
      response = @client.class.get('/cm/list.empty', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end

    # list_id
    # name
    def destroy(options)
      response = @client.class.get('/cm/list.destroy', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end

  end
end
