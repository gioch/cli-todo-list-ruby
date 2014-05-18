require './Controllers/IO'

module Controllers

  class Auth

    def self.check?
      IO.session_exists?
    end

    def self.get_auth_user
      IO.session_user_id
    end

    def self.login? username, password
      IO.create_session? username, password
    end

    def self.logout
      IO.destroy_session 
    end

  end

end