sambatech
=========
[![Build Status](https://travis-ci.org/lorn/sambatech-ruby-gem.png?branch=master)](https://travis-ci.org/lorn/sambatech-ruby-gem)

A Ruby wrapper for the Sambatech REST and Search APIs

## History ##

I've made this Gem, because i need to migrate from Sambatech to an internal video plataform.
This Gem don't support *all* Sambatech API methods only the methods that I need for the migration.
All patchs/pull-requests are welcome :)

## Example of use:

require "rubygems"
require "sambatech"

Sambatech.configure do |config|
  config.key = 'config_key'
  config.endpoint = "http://sambatech_api/2.0/"
end

client = Sambatech.client()

### Get all medias that belongs to the categorie 42, and the media status is active

medias = client.all_medias({
          :filter => 'id;title',
          :search => "channelId:42;status:active",
          :recursiveChannel => 'true',
          :first => 0,
          :limit => 2
})

### Get a specific media info by id ###

media = client.media('8a4980263260ee801423cad08f11bcd',{})

### Get Media file url

media_file = client.media_file_url(media.files.file.id,{})

### Get channel info, parent ###

channel = client.channel(channel_id,{})



