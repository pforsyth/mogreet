module Mogreet
  class Response < Hashie::Mash
    def hash
      self[:hash]      
    end
  end
end