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
	end

end