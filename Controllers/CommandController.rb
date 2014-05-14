require './Controllers/AuthController'
require './Controllers/PrinterController'
require './Controllers/UserController'

module Controllers

	class CommandController

		attr_accessor :command 

		def listen

			@command = get_command

			case @command
				when 'login' 
					if AuthController.check?
						puts "logged user id is " + AuthController.get_auth_user.to_s
					else
						PrinterController.login
						PrinterController.label 'username'
						username = get_command
						PrinterController.label 'password'
						password = get_command

						if AuthController.login? username, password
							PrinterController.admin_wellcome
						else
							PrinterController.invalid_credentials
						end
					end

				when 'create'
					PrinterController.create_account
					PrinterController.label 'username'
					username = get_command
					PrinterController.label 'password'
					password = get_command

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
					puts 'All Tasks'
			end
		end

		def get_command
			gets.chomp
		end
	end

end