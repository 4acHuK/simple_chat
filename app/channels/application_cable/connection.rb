module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', self.current_user.email unless self.current_user.nil?
    end

    protected

    def find_verified_user
      User.find_by(:persistence_token => cookies.signed[:vvc])
    end
  end
end
