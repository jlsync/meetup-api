class MeetupMember < MeetupResource

  # todo: how to automaticaly strip meetup_ in the parent class?
  self.element_name = "member"

  # Examples:
  #  group_members = MeetupMember.for_group('437658')
  #  group_members = MeetupMember.for_group('437658,45679')
  def self.for_group(group_id, api_key = nil)
    @api_key = api_key.blank? ? MEETUP_API_KEY : api_key 

    find_everything(:params => { :group_id => group_id })  
  end

  # Examples:
  #  member = MeetupMember.for_member('437658')
  def self.for_member(member_id, api_key = nil)
    @api_key = api_key.blank? ? MEETUP_API_KEY : api_key 

    find(:first, :params => { :member_id => member_id } )  
  end

end
