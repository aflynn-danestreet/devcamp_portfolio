module ApplicationCable
  class Connection < ActionCable::Connection::Base
    #action cable and web sockets do not have the same access points as our http connections
    #completely different set of paramaters
    # ***have to recreate our current_user method***, if we left this out, web sockets wouldn't know
    # who the current user is
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id
      guest.name = "Guest User"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    protected
    
    def find_verified_user
      # warden provided by devise: tool to use in order to call and 'bypass'
      # what happens with the current_user method cos we don't have access to that here
      # We're recreating it here
      if verified_user = env['warden'].user
        verified_user
      end
    end

  end
end
