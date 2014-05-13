require './Controllers/AuthController'
require './Controllers/PrinterController'

module Controllers

	class CommandController

		attr_accessor :command 

		def listen

			@command = get_command

			case @command
				when 'login' 
					if AuthController.check?
						puts "logged user id is " + AuthController.get_auth_user
					else
						PrinterController.login
						PrinterController.label 'username'
						username = get_command
						PrinterController.label 'password'
						password = get_command

						AuthController.login username, password
					end

				when 'create'
					PrinterController.create_account
					PrinterController.label 'username'
					username = get_command
					PrinterController.label 'password'
					password = get_command

					# check if user is unique.
					# if is -> add to users yaml, create session and return generated user_id
					# show admin wellcome and admin command line

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