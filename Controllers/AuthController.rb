require './Controllers/IOController'

module Controllers

	class AuthController

		def self.check?
			IOController.session_exists?
		end

		def self.get_auth_user
			IOController.session_user_id
		end

		def self.login username, password
			IOController.create_session username, password
		end

		def self.logout
			IOController.destroy_session
		end

	end

end