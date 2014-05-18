require './Controllers/IO'
require './Controllers/Task'

module Controllers

	class User

		def self.unique? username
			IO.user_exists? username
		end

		def self.create_user username, password
			IO.create_user username, password
		end

		def self.tasks
			Task.get_user_tasks 
		end

	end

end