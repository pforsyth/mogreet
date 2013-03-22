require (File.expand_path('../spec_helper', __FILE__))
 
describe Mogreet::List do
  describe 'list.list' do
    before do
      VCR.insert_cassette 'list_list', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.list
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response, %W(lists))
      methods_are_defined(@response.lists.first, %W(id name type))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'list.info' do
    before do
      VCR.insert_cassette 'list_info', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.info(:list_id => 8228)
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response.list, %W(id name type total last_used))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end
  
  describe 'list.create' do
    before do
      VCR.insert_cassette 'list_create', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.create(:name => 'test list')
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

  describe 'list.append' do
    before do
      VCR.insert_cassette 'list_append', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.append(:list_id => '8228', :numbers => '3108675309')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response.statistics, %W(created duplicate rejected))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'list.prune' do
    before do
      VCR.insert_cassette 'list_prune', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.prune(:list_id => '8228', :numbers => '3108675309')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message))
      methods_are_defined(@response.statistics, %W(deleted not_found rejected))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'list.send' do
    before do
      VCR.insert_cassette 'list_send', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.send(
        :campaign_id => ENV['MOGREET_SMS_CAMPAIGN_ID'], 
        :message     => 'hello world',
        :list_id     => '8228'
      )
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

  describe 'list.download' do
    before do
      VCR.insert_cassette 'list_download', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.download(:list_id => '8228')
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message recipients))
    end
    
    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'list.empty' do
    before do
      VCR.insert_cassette 'list_empty', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.empty(:list_id => '8228', :name => 'test')
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

  describe 'list.destroy' do
    before do
      VCR.insert_cassette 'list_destroy', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.list.destroy(:list_id => '8228', :name => 'test')
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