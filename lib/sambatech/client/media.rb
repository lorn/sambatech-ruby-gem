module Sambatech
  class Client
    # Defines methods related to media items
    module Media
      # Returns extended information of a given media item
      #
      # @overload media_item(id)
      # @param user [Integer] An Instagram media item ID
      # @return [Hashie::Mash] The requested media item.
      # @example Return extended information for media item 1234
      # Instagram.media_item(1324)
      # @format :json
      # @authenticated false unless requesting media from a protected user
      #
      # If getting this data of a protected user, you must authenticate (and be allowed to see that user).
      # @rate_limited true
      # @see TODO:docs url
      def media(*args)
        id = args.first || 'self'
        response = get("medias/#{id}")
        response["data"]
      end

      def all_medias(*args)
        id = args.first || 'self'
        response = get("medias")
        response["data"]
      end
    end
  end
end


