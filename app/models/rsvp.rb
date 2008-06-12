
class Rsvp < MeetupResource

  # Example:
  #  Rsvp.for_event('437658')
  def self.for_event(event_id)
    find(:all, :params => { :event_id => event_id } )  
  end

end
