module CurrentUserConcern
  extend ActiveSupport::Concern
    
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "guest", 
                  first_name:"guest", 
                  last_name:"guest", 
                  email: "guestmail")
  end

end