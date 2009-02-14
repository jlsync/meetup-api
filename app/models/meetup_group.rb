
class MeetupGroup < MeetupResource

  # todo: how to automaticaly strip meetup_ in the parent class?
  self.element_name = "group"

  # Example:
  #  MeetupMember.for_group('437658')
  def self.for_member(member_id, api_key = nil)
    @api_key = api_key.blank? ? MEETUP_API_KEY : api_key 

    find_everything( :params => { :member_id => member_id } )  
  end

end
