require './Controllers/AuthController'
require './Controllers/PrinterController'

module Controllers

	class CommandController

		attr_accessor :command 

		def listen

			@command = gets.chomp

			case @command
				when 'login' 
					if AuthController.check?
						p 'User allready logged in' 
					else
						PrinterController.label 'username'
						username = gets.chomp
						PrinterController.label 'password'
						password = gets.chomp

						AuthController.login username, password 
					end

				when 'create'
					p 'user created'

				when 'logout'
					p 'User logged out'

				when 'tasks'
					p 'All Tasks'
			end
		end
	end

end