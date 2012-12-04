module Sambatech
  # Wrapper for the Sambatech REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {TODO:doc_URL the Sambatech API Documentation}.
  # @see TODO:doc_url
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    # include Sambatech::Client::Utils

    # include Sambatech::Client::Users
    # include Sambatech::Client::Media
    # include Sambatech::Client::Locations
    # include Sambatech::Client::Geographies
    # include Sambatech::Client::Tags
    # include Sambatech::Client::Comments
    # include Sambatech::Client::Likes
    # include Sambatech::Client::Subscriptions
  end
end

