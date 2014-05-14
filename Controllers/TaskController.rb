require './Controllers/IOController'

module Controllers

	class TaskController

		def self.get_user_tasks
			IOController.get_tasks
		end

		def self.create_new_task title, estimation
			IOController.new_task title, estimation
		end

	end

end