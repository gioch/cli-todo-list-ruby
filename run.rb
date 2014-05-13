require './Controllers/CommandController'
require './Controllers/UserController'
require './Controllers/PrinterController'

require 'yaml'

commandsCtrl = Controllers::CommandController.new 

Controllers::PrinterController.wellcome

until commandsCtrl.command == 'exit'

	commandsCtrl.listen

end