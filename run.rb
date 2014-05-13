require './Controllers/CommandController'
require './Controllers/PrinterController'

require 'yaml'

commandsCtrl = Controllers::CommandController.new 

Controllers::PrinterController.wellcome

until commandsCtrl.command == 'exit'

	commandsCtrl.listen

end