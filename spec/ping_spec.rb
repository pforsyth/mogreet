require (File.expand_path('../spec_helper', __FILE__))
 
describe Mogreet::System do
  describe 'system.ping' do
    before do
      VCR.insert_cassette 'ping_success', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.system.ping
    end

    after do
      VCR.eject_cassette
    end
  
    it "must have successful message" do
      @response.message.must_equal 'pong'
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'system.ping fail' do
    before do
      VCR.insert_cassette 'ping_invalid', :record => :new_episodes
      client = Mogreet::Client.new('11111', 'xxxxxx')
      @response = client.system.ping
    end

    after do
      VCR.eject_cassette
    end

    it "must have error message" do
      @response.message.must_equal 'Mogreet: 403 Forbidden'
    end

    it "must have negative code value" do
      @response.code.must_equal '0'
    end
  end
end