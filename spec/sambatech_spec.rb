require File.expand_path('../spec_helper', __FILE__)

describe Sambatech do
  after do
    Sambatech.reset
  end

  context "when delegating to a client" do

     before do
       stub_get("users/self/feed.json").
         to_return(:body => fixture("user_media_feed.json"), :headers => {:content_type => "application/json; charset=utf-8"})
     end

   end

  describe ".client" do
    it "should be a Sambatech::Client" do
      Sambatech.client.should be_a Sambatech::Client
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      Sambatech.adapter.should == Sambatech::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      Sambatech.adapter = :typhoeus
      Sambatech.adapter.should == :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      Sambatech.endpoint.should == Sambatech::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      Sambatech.endpoint = 'http://tumblr.com'
      Sambatech.endpoint.should == 'http://tumblr.com'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      Sambatech.user_agent.should == Sambatech::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      Sambatech.user_agent = 'Custom User Agent'
      Sambatech.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".configure" do

    Sambatech::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        Sambatech.configure do |config|
          config.send("#{key}=", key)
          Sambatech.send(key).should == key
        end
      end
    end
  end
end
