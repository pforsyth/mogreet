require (File.expand_path('../spec_helper', __FILE__))

describe Mogreet::Config do
  describe 'deprecated way of sending MMS' do
    before do
      VCR.insert_cassette 'deprecated_mms', :record => :new_episodes
      
      Mogreet.configure do |config|
        config.client_id   = '1010101'
        config.token       = 'xyxyxyxyxyxyxyxyxyxyxyxyxyx'
        config.campaign_id = ENV['MOGREET_MMS_CAMPAIGN_ID']
      end
      
      @response = Mogreet::Message.send(
        :to           => '3108675309',
        :message      => 'Hello World!',
        :content_url  => 'http://rubyonrails.org/images/rails.png'
      )
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message message_id))
    end
    
    it "must have success code value" do
      @response.code.must_equal '1'
    end
    
    it "must have correct transaction_hash value" do
      @response.transaction_hash.must_equal 'd4coz040'
    end    
  end
end