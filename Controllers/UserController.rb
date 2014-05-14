require './Controllers/IOController'

module Controllers

	class UserController

		def self.unique? username
			IOController.user_exists? username
		end

		def self.create_user username, password
			IOController.create_user username, password
		end

	end

end