require 'rest_client'
require 'hashie'
require 'json'

module Mogreet
  class Client
    # include Request
    
    attr_accessor :client_id, :token, :http_response

    def initialize(client_id, token)
      @client_id = client_id
      @token     = token
    end
        
    def get_request(path, query_params = {})
      params = default_api_args.merge(query_params)
      @http_response = RestClient.get("https://api.mogreet.com#{path}", {:params => params})
      Response.new(JSON.parse(@http_response.body)).response
    end
    
    def post_request(path, query_params = {})
      params = default_api_args.merge(query_params)
      @http_response = RestClient.post("https://api.mogreet.com#{path}", params)
      Response.new(JSON.parse(@http_response.body)).response
    end
    
    def list
      @list ||= List.new(self)
    end

    def user
      @user ||= User.new(self)
    end

    def media
      @media ||= Media.new(self)
    end

    def system
      @system ||= System.new(self)
    end
    
    def keyword
      @keyword ||= Keyword.new(self)
    end

    def transaction
      @transaction ||= Transaction.new(self)      
    end

    private
    
    def default_api_args
      {:client_id => @client_id, :token => @token, :format => 'json'}
    end
    
  end
  
end
