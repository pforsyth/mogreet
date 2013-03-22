require (File.expand_path('../spec_helper', __FILE__))
 
describe Mogreet::Media do
  describe 'media.list' do
    before do
      VCR.insert_cassette 'media_list', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.media.list
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message media_list))
      methods_are_defined(@response.media_list.first, %W(name type content_id smart_url filename))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end

  describe 'media.upload' do
    before do
      VCR.insert_cassette 'media_upload', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      upload_file = "#{File.dirname(__FILE__)}/fixtures/api.jpg"
      @response = client.media.upload(:name => 'upload name', :type => 'image', :file => File.new(upload_file))
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message media))
      methods_are_defined(@response.media, %W(name content_id smart_url))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end
  
  describe 'media.destroy' do
    before do
      VCR.insert_cassette 'media_destroy', :record => :new_episodes
      client = Mogreet::Client.new('1010101', 'xyxyxyxyxyxyxyxyxyxyxyxyxyx')
      @response = client.media.destroy(:content_id => 308685)
    end

    after do
      VCR.eject_cassette
    end

    it "has all expected attributes" do
      methods_are_defined(@response, %W(status message media))
    end

    it "must have success code value" do
      @response.code.must_equal '1'
    end
  end
  
end