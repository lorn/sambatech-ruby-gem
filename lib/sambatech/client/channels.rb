require "pp"
module Sambatech
  class Client
    # Defines methods related to media items
    module Channels
      # Returns extended information of a given media item
      #
      # @overload media_item(id)
      # @param media-id [Hash] An Sambatech media item ID
      # @return [Hashie::Mash] The requested media item.
      # @example Return extended information for media item 1234
      # Instagram.media_item(1324)
      # @format :xml
      #
      # If getting this data of a protected user, you must authenticate (and be allowed to see that user).
      # @rate_limited true
      # @see TODO:docs url
      # first   [Número] (opcional) Posição inicial da lista. (valor padrão:0)  query
      # limit   [Número] (opcional) Número de elementos na lista, limitado a 50. (valor padrão:50)  query
      # search  [String] (opcional) O parâmetro search deve ser usado para definir critérios para a busca. Entre parênteses estão os operadores usados durante a busca (implícitos). Os únicos operadores que devem ser explicitados são: (>, <, >=, <=). O operador (==) deve ser usado como no exemplo anterior. Os campos do objeto Media que podem ser usados são:
      def channel(*args,options)
        id = args.first || 'self'
        response = get("channels/#{id}", options)
        response["Channel"]
      end

    end
  end
end


