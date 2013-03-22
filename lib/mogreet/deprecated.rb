require 'hashie'

module Mogreet
  class Config < Hashie::Mash ; end

  def self.config
     @@config ||= Config.new
   end

   def self.configure
     @@config = Config.new
     yield config
   end

  class Response
    class TransactionSend < Hashie::Mash
      def transaction_hash
        self[:hash]
      end
    end
  end

  class Message
    class << self
      def send(options)
        params = Mogreet.config.merge(options).merge(:format => :json)
        response = RestClient.get("https://api.mogreet.com/moms/transaction.send", {:params => params.to_hash})
        Mogreet::Response::TransactionSend.new(JSON.parse(response.body)).response
      end
    end
  end
end


# - "{\"client_id\"=>\"714\", \"token\"=>\"a48951eed1e8b093fbea70d882257d84\", \"campaign_id\"=>\"20861\", \"to\"=>\"3104656416\", \"message\"=>\"Hello World!\", \"content_url\"=>\"http://rubyonrails.org/images/rails.png\", \"format\"=>:json}"

# Configuration
# Configure mogreet (add this block to config/initializers/mogreet.rb in case of Rails application):
# 
# Mogreet.configure do |config|
#   config.client_id   = "123"
#   config.token       = "ee91dfa14e59a8600d7976c554f2ed12"
#   config.campaign_id = "19001"
# end
# Usage
# Send MMS message:
# 
# response = Mogreet::Message.send to: '5551236789',
#                                  message: 'Hello World!',
#                                  content_url: 'http://rubyonrails.org/images/rails.png'
# 
# response.status           #=> "success"
# response.code             #=> "1"
# response.message          #=> "Mogreet successfully sent!"
# response.message_id       #=> 123456789
# response.transaction_hash #=> "a12b3c4d"
