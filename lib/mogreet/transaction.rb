module Mogreet
  class Transaction
    def initialize(client)
      @client = client
    end

    ##
    # campaign_id:  An ID connected to a specific campaign 
    # to:           The mobile number (MSISDN) of the handset you would like to send to.
    # from:         The mobile number (MSISDN) of the handset you would like to send from. Or the shortcode associated with the campaign. (Optional – if not included, this parameter will default to the shortcode associated to the campaign).
    # message:      The message presented to the "to" user.
    # content_id:   An integer value associated to a piece of content ingested through the Campaign Manager or API.
    # content_url:  A publicly accessible URL of an image, audio or video. MOMS will automagically ingest the content and deliver it as specified by the campaign flow. (Optional, used for SMS and MMS delivering audio, image or video)
    # callback:     If provided with a valid URL, any errors with the transaction will be sent to this URL via XML over HTTP. See description below.  
    def send(options)
      response = @client.class.get('/moms/transaction.send', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end
  
    # client_id Your  client  id. Log onto  the Campaign  Manager to  access  your  client  id.
    # token Your  token.  Log onto  the Campaign  Manager to  access  your  token.
    # message_id A  unique  ID  returned  from  a successful  transaction.send  request or  from  
    # user.transactions method.
    # hash A  hash  returned  from  a successful  transaction.send  request or  from  a 
    # user.transactions method.
    def lookup(options)
      # q6z5e0on
      response = @client.class.get('/moms/transaction.lookup', :query => options)
      Hashie::Mash.new(response.parsed_response).response
    end
  end
end