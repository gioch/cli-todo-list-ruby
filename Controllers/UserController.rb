require './Controllers/IOController'
require './Controllers/TaskController'

# User Controller

module Controllers

	class UserController

		def self.unique? username
			IOController.user_exists? username
		end

		def self.create_user username, password
			IOController.create_user username, password
		end

		def self.tasks
			TaskController.get_user_tasks 
		end

	end

end