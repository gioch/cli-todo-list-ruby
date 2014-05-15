require './Controllers/AuthController'
require './Controllers/PrinterController'
require './Controllers/UserController'
require './Controllers/TaskController'

module Controllers

	class CommandController

		attr_accessor :command 

		def listen

			@command = get_console_input

			case @command
				when 'login' 
					if AuthController.check?
						PrinterController.user_logged
					else
						PrinterController.login
						PrinterController.label 'username'
						username = get_console_input
						PrinterController.label 'password'
						password = get_console_input

						if AuthController.login? username, password
							PrinterController.admin_wellcome
						else
							PrinterController.invalid_credentials
						end
					end

				when 'create'
					PrinterController.create_account
					PrinterController.label 'username'
					username = get_console_input
					PrinterController.label 'password'
					password = get_console_input

					if UserController.unique? username
						UserController.create_user username, password
						if AuthController.login? username, password
							PrinterController.admin_wellcome
						else
							PrinterController.invalid_credentials
						end
					else
						PrinterController.not_unique_user
					end

				when 'logout'
					AuthController.logout

				when 'tasks'
					PrinterController.tasks

					user_tasks = UserController.tasks

					PrinterController.show_tasks user_tasks

				when 'add'
					PrinterController.add_task
					PrinterController.label "Task Title"
					task_title = get_console_input

					PrinterController.label "days you need to finish?"
					task_estimation_time = get_console_input

					TaskController.create_new_task task_title, task_estimation_time

				when 'delete'
					PrinterController.label "Task Id To Delete"
					task_id = get_console_input
					task_id = task_id.to_i

					TaskController.delete_task task_id
			end
		end

		def get_console_input
			gets.chomp
		end
	end

end