module Mogreet
  class User
    def initialize(client)
      @client = client
    end

    def lookup(options)
      response = @client.class.get('/moms/user.lookup', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end
  
    # Name Description
    # client_id Your  client  id. Log onto  the Campaign  Manager to  access  your  client  id.
    # token Your  token.  Log onto  the Campaign  Manager to  access  your  token.
    # number A  mobile  number  (MSISDN).
    # campaign_id A campaign  id  to  search  on. (Optional - if  excluded, returns all opt in  statuses  for the client’s  campaigns)  
    # start_date (Optional) Narrow  search  by  adding  a date  to  start searching on  [YYYY-MM-DD]
    # end_date (Optional) Narrow  search  by  adding  a date  to  stop  searching on  [YYYY-MM-DD]
    def transactions(options)
      response = @client.class.get('/moms/user.transactions', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end
  
    def info(options)
      response = @client.class.get('/moms/user.info', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end

    def uncache(options)
      response = @client.class.get('/moms/user.uncache', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end
    
    # number
    # campaign_id
    def getopt(options)
      response = @client.class.get('/moms/user.getopt', :query => options)
      Hashie::Mash.new(response.parsed_response).response      
    end

  end
end