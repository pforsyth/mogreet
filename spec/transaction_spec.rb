require (File.expand_path('../spec_helper', __FILE__))
 
describe Mogreet::Transaction do
  describe 'sms send success' do
    before do
      VCR.insert_cassette 'transaction_send', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.transaction.send(
        :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'], 
        :to          => '3108675309',
        :message     => 'hello world'
      )
    end

    after do
      VCR.eject_cassette
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message message_id))
    end
    
    it "must have valid hash method" do
      @response.hash.must_equal 'nm8ewqsd'
    end
  end
  
  describe 'lookup success' do
    before do
      VCR.insert_cassette 'transaction_lookup', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.transaction.lookup(:hash => 'nm8ewqsd', :message_id => '184299036')
    end

    after do
      VCR.eject_cassette
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response.transaction, %W(campaign_id from from_name to to_name status))
    end
      
  end
end