require './Controllers/IOController'

module Controllers

	class UserController

		def self.unique? username, password
			IOController.user_exists? username, password
		end
	end

end