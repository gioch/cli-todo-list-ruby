require './Controllers/IO'

module Controllers

	class Task

		def self.get_user_tasks
			IO.get_tasks
		end

		def self.create_new_task title, estimation
			IO.new_task title, estimation
		end

		def self.delete_task task_id
			IO.delete_task task_id
		end

	end

end