#
# ActiveResource Models for the meetup.com api.
#
class MeetupResource < ActiveResource::Base

  self.site = "http://api.meetup.com/"

  attr_accessor :apikey
  
  # Get your API key at http://www.meetup.com/meetup_api/key/?op=reset
  APIKEY = "put-your-api-key-here" 

  module MeetupXmlFormat
    extend self

    def extension 
      "xml"
    end

    def mime_type
      "application/xml"
    end

    def decode(xml)
      Hash.from_xml(xml.sub('latin-1','Latin1'))["results"]["items"].values
    end

  end

  self.format = MeetupResource::MeetupXmlFormat

  def self.find(scope, args = {})
    if args[:params]
      args[:params].merge!({:key => @apikey || APIKEY })
    end
    super(scope, args)
  end

end
