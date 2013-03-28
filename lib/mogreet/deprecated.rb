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
