module Controllers

	class PrinterController

		def self.wellcome
			puts '+----------------------------------------------------+'
			puts '| Wellcome                                           |'
			puts '+----------------------------------------------------+'
		end

		def self.label label
			puts "Type your #{label} :"
		end

		def self.login
			puts "Login To Account:"
		end

		def self.create_account
			puts "Create Account:"
		end

		def self.not_unique_user
			puts "User with this username allready exists!"
		end

		def self.invalid_credentials
			puts "Error in username or password!"
		end

		def self.admin_wellcome
			puts '+----------------------------------------------------+'
			puts '| Wellcome To Admin Panel                            |'
			puts '+----------------------------------------------------+'
		end

		def self.show_tasks tasks_array
			
			puts "+--------------------------------- User Tasks ---------------------------------+\n\n\n"

			tasks_array.each do |task|
				puts " #{task[:id]} - #{task[:title]} - #{task[:due_date]} \n\n"
			end

			puts "+---------------------------------            ---------------------------------+"

		end

	end

end