require (File.expand_path('../spec_helper', __FILE__))
 
describe Mogreet::Keyword do
  describe 'keyword.list' do
    before do
      VCR.insert_cassette 'keyword_list', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.keyword.list
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response, %W(keywords))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'keyword.check' do
    before do
      VCR.insert_cassette 'keyword_check', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.keyword.check(:keyword => 'reallylongkeyword12345', :shortcode => '343434')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message available))
    end
    
    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'keyword.add' do
    before do
      VCR.insert_cassette 'keyword_add', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.keyword.add(:keyword => 'reallylongkeyword12345', :shortcode => '343434', :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'])
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
  
  describe 'keyword.remove' do
    before do
      VCR.insert_cassette 'keyword_remove', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.keyword.remove(:keyword => 'reallylongkeyword12345', :shortcode => '343434', :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'])
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