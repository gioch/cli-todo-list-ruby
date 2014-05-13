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
	end

end