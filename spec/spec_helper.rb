begin
  require 'simplecov'
rescue LoadError
  # ignore
else
  SimpleCov.start do
    add_group 'Sambatech', 'lib/Sambatech'
    add_group 'Specs', 'spec'
  end
end

require File.expand_path('../../lib/Sambatech', __FILE__)

require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.include WebMock::API
end

def a_delete(path)
  a_request(:delete, Sambatech.endpoint + path)
end

def a_get(path)
  a_request(:get, Sambatech.endpoint + path)
end

def a_post(path)
  a_request(:post, Sambatech.endpoint + path)
end

def a_put(path)
  a_request(:put, Sambatech.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, Sambatech.endpoint + path)
end

def stub_get(path)
  stub_request(:get, Sambatech.endpoint + path)
end

def stub_post(path)
  stub_request(:post, Sambatech.endpoint + path)
end

def stub_put(path)
  stub_request(:put, Sambatech.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
