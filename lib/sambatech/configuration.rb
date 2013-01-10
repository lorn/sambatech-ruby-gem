require 'faraday'
require File.expand_path('../version', __FILE__)

module Sambatech
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {Sambatech::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :key,
      :endpoint,
      :user_agent,
      :proxy
    ].freeze

    # An array of valid request/response formats
    #
    # @note Not all methods support the XML format.
    VALID_FORMATS = [
      :xml].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set a user key
    DEFAULT_KEY = nil

    # The endpoint that will be used to connect if none is set
    #
    # @note There is no reason to use any other endpoint at this time
    DEFAULT_ENDPOINT = 'http://fast.api.liquidplatform.com/2.0/'.freeze

    # The response format appended to the path and sent in the 'Accept' header if none is set
    #
    # @note XML is the only available format at this time
    DEFAULT_FORMAT = :xml

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Sambatech Ruby Gem #{Sambatech::VERSION}".freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter = DEFAULT_ADAPTER
      self.key = DEFAULT_KEY
      self.endpoint = DEFAULT_ENDPOINT
      self.user_agent = DEFAULT_USER_AGENT
      self.proxy = DEFAULT_PROXY
    end
  end
end