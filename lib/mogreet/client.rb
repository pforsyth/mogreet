require 'httparty'
require 'hashie'

module Mogreet
  class Client
    include HTTParty
    base_uri 'https://api.mogreet.com'
    format :json
    default_params :format => 'json'

    def initialize(client_id, token)
      self.class.default_params :client_id => client_id, :token => token
    end
    
    def system
      @system ||= System.new(self)
    end
    
    def transaction
      @transaction ||= Transaction.new(self)      
    end
    
    def user
      @user ||= User.new(self)
    end

    def keyword
      @keyword ||= Keyword.new(self)
    end
    
  end
end
