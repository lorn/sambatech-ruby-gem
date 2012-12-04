require File.expand_path('../sambatech/error', __FILE__)
require File.expand_path('../sambatech/configuration', __FILE__)
require File.expand_path('../sambatech/api', __FILE__)
require File.expand_path('../sambatech/client', __FILE__)

module Sambatech
  extend Configuration

  # Alias for Sambatech::Client.new
  #
  # @return [Sambatech::Client]
  def self.client(options={})
    Sambatech::Client.new(options)
  end

  # Delegate to Sambatech::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Sambatech::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end