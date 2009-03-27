class MeetupRsvp < MeetupResource

  # Example:
  #  rsvps = MeetupRsvp.for_event('437658')
  def self.for_event(event_id, api_key = nil)
    @api_key = api_key.blank? ? MEETUP_API_KEY : api_key 

    find_everything(:params => { :event_id => event_id } )  
  end

  def member_id
    # taken from the link attribute
    #"link"=>"http://www.meetup.com/members/6410758"
    link.match(/\d+$/)[0]
  end

end
