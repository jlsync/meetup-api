
class Rsvp < MeetupResource

  # todo: how to automaticaly strip meetup_ in the parent class?
  self.element_name = "rsvp"

  # Example:
  #  Rsvp.for_event('437658')
  def self.for_event(event_id)
    find(:all, :params => { :event_id => event_id } )  
  end

end
