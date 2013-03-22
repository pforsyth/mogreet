Mogreet API 
===========

A Ruby wrapper for the Mogreet API.

Examples assume that your credentials are set via config vars (https://devcenter.heroku.com/articles/config-vars). 

##Installation
Install the gem by issuing

    gem install mogreet

or put it in your Gemfile and run `bundle install`

    gem "mogreet"

## Usage Examples

__Create client__

    client = Mogreet::Client.new('111111', 'xyxyxyxyxyxyxyxyxyxyxyx')

__Ping__
    
    response = client.system.ping
    puts response.message
    
    
__Send MMS to one recipient__

    response = client.transaction.send(
      :campaign_id => ENV['MOGREET_MMS_CAMPAIGN_ID'], 
      :to          => '1111111111', 
      :message     => 'hello world', 
      :content_url => 'https://wp-uploads.mogreet.com/wp-uploads/2013/02/API-Beer-sticker-300dpi-1024x1024.jpg'
    )

__Send SMS to one recipient__

    response = client.transaction.send(
      :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'], 
      :to          => '1111111111', 
      :message     => 'hello world'
    )

__Send SMS to list of recipients__
    
    response = client.list.send(
      :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'], 
      :message     => 'hello world',
      :list_id     => '8228'
    )


__Upload File__
    
    response = client.media.upload(
      :name => 'upload name', 
      :type => 'image', 
      :file => File.new("image.jpg")
    )

## Contributors

The Mogreet gem was initially created by Andrew Hage and Mateusz Dominiak, but has been turned over to the Mogreet's [Paul Forsyth](http://github.com/pforsyth) to develop and maintain.
