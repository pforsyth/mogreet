require (File.expand_path('../spec_helper', __FILE__))
 
describe Mogreet::User do
  describe 'user.lookup' do
    before do
      VCR.insert_cassette 'user_lookup_success', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.user.lookup(:number => '3108675309')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(message number carrier_id carrier_name handset_id handset_name))
    end
    
    it "must have success code value" do
      @response.code.must_equal '1'
    end
  
  end
  
  describe 'user.transactions' do
    before do
      VCR.insert_cassette 'user_transactions_success', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.user.transactions(:number => '3108675309')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response, %W(transactions))
      methods_are_defined(@response.transactions.first, %W(campaign_id campaign_name datestamp message_id from to))      
    end
    
    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end
  
  describe 'user.info' do
    before do
      VCR.insert_cassette 'user_info_success', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.user.info(:number => '3108675309')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end
end