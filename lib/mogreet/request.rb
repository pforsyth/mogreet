module Mogreet
  module Request
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
    
    def default_api_args
      {:client_id => @client_id, :token => @token, :format => 'json'}
    end
  end  
end