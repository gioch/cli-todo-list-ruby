module Controllers

	class CommandController

		attr_accessor :command

		def listen

			@command = gets.chomp

			case @command
				when 'login' 
					p 'User logged in'

				when 'create'
					p 'New user created'

				when 'logout'
					p 'User logged out'

				when 'tasks'
					p 'All Tasks'
			end
		end
	end

end