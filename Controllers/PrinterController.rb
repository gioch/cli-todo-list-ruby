module Controllers

	#Printer Controller
	class PrinterController

		def self.wellcome
			puts '+----------------------------------------------------+'
			puts '| Wellcome                                           |'
			puts '+----------------------------------------------------+'
		end

		def self.label label
			puts "Type #{label}:"
		end

		def self.login
			puts '+----------------------------------------------------+'
			puts '| Login To Account:                                  |'
			puts '+----------------------------------------------------+'
		end

		def self.user_logged
			puts '+----------------------------------------------------+'
			puts '| User Allready Logged In!                           |'
			puts '+----------------------------------------------------+'
		end

		def self.create_account
			puts '+----------------------------------------------------+'
			puts '| Create Account:                                    |'
			puts '+----------------------------------------------------+'
		end

		def self.not_unique_user
			puts '+----------------------------------------------------+'
			puts '| User with this username allready exists            |'
			puts '+----------------------------------------------------+'
		end

		def self.invalid_credentials
			puts '+----------------------------------------------------+'
			puts '| Error in username or password!                     |'
			puts '+----------------------------------------------------+'
		end

		def self.admin_wellcome
			puts '+----------------------------------------------------+'
			puts '| Wellcome To Admin Panel                            |'
			puts '+----------------------------------------------------+'
		end

		def self.add_task
			puts '+----------------------------------------------------+'
			puts '| Add New Task                                       |'
			puts '+----------------------------------------------------+'
		end

		def self.tasks
			puts '+----------------------------------------------------+'
			puts '| All Tasks                                          |'
			puts '+----------------------------------------------------+'
		end

		def self.show_tasks tasks_array
			
			puts "+---------- User Tasks ----------+\n\n"

			tasks_array.each do |task|
				puts " #{task[:id]} - #{task[:title]} - #{task[:due_date]} \n\n"
			end

			puts "+-------------------------------+"

		end

	end

end