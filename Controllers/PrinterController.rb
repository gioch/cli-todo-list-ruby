module Controllers

	class PrinterController

		def self.wellcome
			p '+----------------------------------------------------+'
			p '| Wellcome                                           |'
			p '+----------------------------------------------------+'
		end

		def self.label label
			p "Type your #{label} :"
		end
	end

end