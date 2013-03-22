module Mogreet
  class User
    def initialize(client)
      @client = client
    end

    def lookup(options)
      @client.get_request('/moms/user.lookup', options)      
    end
  
    # Name Description
    # client_id Your  client  id. Log onto  the Campaign  Manager to  access  your  client  id.
    # token Your  token.  Log onto  the Campaign  Manager to  access  your  token.
    # number A  mobile  number  (MSISDN).
    # campaign_id A campaign  id  to  search  on. (Optional - if  excluded, returns all opt in  statuses  for the client’s  campaigns)  
    # start_date (Optional) Narrow  search  by  adding  a date  to  start searching on  [YYYY-MM-DD]
    # end_date (Optional) Narrow  search  by  adding  a date  to  stop  searching on  [YYYY-MM-DD]
    def transactions(options)
      @client.get_request('/moms/user.transactions', options)      
    end
  
    def info(options)
      @client.get_request('/moms/user.info', options)      
    end

    def uncache(options)
      @client.get_request('/moms/user.uncache', options)      
    end
    
    # number
    # campaign_id
    def getopt(options)
      @client.get_request('/moms/user.getopt', options)      
    end

  end
end