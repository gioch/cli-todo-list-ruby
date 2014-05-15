require './Controllers/IOController'

#Task Controller

module Controllers

	class TaskController

		def self.get_user_tasks
			IOController.get_tasks
		end

		def self.create_new_task title, estimation
			IOController.new_task title, estimation
		end

		def self.delete_task task_id
			IOController.delete_task task_id
		end

	end

end