Mogreet API 
===========

Examples assume that your credentials are set via config vars (https://devcenter.heroku.com/articles/config-vars). 

__Ping__
    
    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    response = client.system.ping
    puts response.message
    
    
__Send MMS to one recipient__

    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    response = client.transaction.send(
      :campaign_id => ENV['MOGREET_MMS_CAMPAIGN_ID'], 
      :to          => '1111111111', 
      :message     => 'hello world', 
      :content_url => 'https://wp-uploads.mogreet.com/wp-uploads/2013/02/API-Beer-sticker-300dpi-1024x1024.jpg'
    )

__Send SMS to one recipient__

    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    response = client.transaction.send(
      :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'], 
      :to          => '1111111111', 
      :message     => 'hello world'
    )

__Send SMS to list of recipients__
    
    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    response = client.list.send(
      :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'], 
      :message     => 'hello world',
      :list_id     => '8228'
    )


__Upload File__
    
    client   = Mogreet::Client.new(ENV['MOGREET_CLIENT_ID'], ENV['MOGREET_TOKEN'])
    response = client.media.upload(
      :name => 'upload name', 
      :type => 'image', 
      :file => File.new("image.jpg")
    )

