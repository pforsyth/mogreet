Mogreet API 
===========

Examples assume that your credentials are set via config vars (https://devcenter.heroku.com/articles/config-vars). 

__ping__
    
    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    response = client.system.ping
    puts response.message
    
    
__send__

    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    img_url  = 'https://wp-uploads.mogreet.com/wp-uploads//2013/02/API-Beer-sticker-300dpi-1024x1024.jpg'
    response = client.transaction.send(
      :campaign_id => ENV['MOGREET_MMS_CAMPAIGN_ID'], 
      :to          => '1111111111', 
      :message     => 'hello world', 
      :content_url => img_url
    )
    puts response.message

